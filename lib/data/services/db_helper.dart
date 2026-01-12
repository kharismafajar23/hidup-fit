import 'package:hidup_fit/data/models/article.dart';
import 'package:hidup_fit/data/models/rumahSakit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;
  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // =====================================================================
  // INIT DATABASE
  // =====================================================================
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'app.db'),
      version: 13,
      onCreate: (db, version) async {
        await _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Tambah kolom "jenis_kelamin" di users
        if (oldVersion < 7) {
          await _safeAddColumn(
            db,
            table: "users",
            column: "jenis_kelamin",
            type: "TEXT",
          );
        }

        // Tambah kolom "laju_pernafasan" di dataKesehatan
        if (oldVersion < 10) {
          await _safeAddColumn(
            db,
            table: "dataKesehatan",
            column: "laju_pernafasan",
            type: "TEXT",
          );
        }

        if (oldVersion < 13) {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS screening_results (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              id_user INTEGER NOT NULL,
              tanggal TEXT NOT NULL DEFAULT (datetime('now')),
              prompt TEXT,
              hasil TEXT,
              model TEXT
            )
          ''');
        }
      },
    );
  }

  // =====================================================================
  // SAFE ADD COLUMN (ANTI DUPLICATE)
  // =====================================================================
  Future<void> _safeAddColumn(
    Database db, {
    required String table,
    required String column,
    required String type,
  }) async {
    // ambil info table
    final columns = await db.rawQuery("PRAGMA table_info($table)");

    final exist = columns.any((col) => col['name'] == column);

    if (!exist) {
      await db.execute("ALTER TABLE $table ADD COLUMN $column $type");
    }
  }

  // =====================================================================
  // CREATE TABLES
  // =====================================================================
  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        name TEXT,
        password TEXT,
        tanggal_lahir TEXT,
        jenis_kelamin TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS articles(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        imageUrl TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS dataKesehatan(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_user INTEGER,
        tanggal TEXT NOT NULL DEFAULT (datetime('now')),
        berat_badan TEXT,
        tekanan_darah TEXT,
        detak_jantung TEXT,
        tinggi_badan TEXT,
        suhu_tubuh TEXT,
        jumlah_langkah TEXT,
        laju_pernafasan TEXT,
        catatan TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS rumah_sakit (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        alamat TEXT NOT NULL,
        gambar TEXT,
        latitude REAL,
        longitude REAL,
        kontak TEXT
      )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS screening_results (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_user INTEGER NOT NULL,
      tanggal TEXT NOT NULL DEFAULT (datetime('now')),
      hasil TEXT,
    )
  ''');
  }

  // =====================================================================
  // RESET DATABASE
  // =====================================================================
  Future<void> resetDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');
    await deleteDatabase(path);
    _database = null;
  }

  // =====================================================================
  // USERS
  // =====================================================================
  Future<void> insertUser(
    String name,
    String tanggalLahir,
    String username,
    String password,
    String? jenisKelamin,
  ) async {
    final db = await instance.database;
    await db.insert('users', {
      'name': name,
      'tanggal_lahir': tanggalLahir,
      'username': username,
      'password': password,
      'jenis_kelamin': jenisKelamin ?? '',
    });
  }

  Future<void> updateUser(
    int id,
    String name,
    String username,
    String tanggalLahir,
    String password,
    String jenisKelamin,
  ) async {
    final db = await instance.database;
    await db.update(
      'users',
      {
        'name': name,
        'username': username,
        'tanggal_lahir': tanggalLahir,
        'password': password,
        'jenis_kelamin': jenisKelamin,
      },
      where: 'id = ?',
      whereArgs: [
        id
      ],
    );
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [
        username,
        password
      ],
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String, dynamic>?> getUserByUsername(String username) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [
        username
      ],
    );
    return result.isNotEmpty ? result.first : null;
  }

  // =====================================================================
  // ARTICLES
  // =====================================================================
  static Future<void> insertArticle(Article article) async {
    final db = await instance.database;
    await db.insert('articles', article.toMap());
  }

  static Future<List<Article>> getArticles() async {
    final db = await instance.database;
    final maps = await db.query('articles');
    return List.generate(maps.length, (i) => Article.fromMap(maps[i]));
  }

  Future<void> resetArticles() async {
    final db = await instance.database;
    await db.delete('articles');
  }

  // =====================================================================
  // RUMAH SAKIT
  // =====================================================================
  static Future<void> insertRumahSakit(RumahSakit rumahSakit) async {
    final db = await instance.database;
    await db.insert(
      'rumah_sakit',
      rumahSakit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<RumahSakit>> getRumahSakit() async {
    final db = await instance.database;
    final maps = await db.query('rumah_sakit');
    return List.generate(maps.length, (i) => RumahSakit.fromMap(maps[i]));
  }

  // =====================================================================
  // DATA KESEHATAN
  // =====================================================================
  Future<void> insertDataKesehatan({
    required int idUser,
    String? tanggal,
    String? beratBadan,
    String? tekananDarah,
    String? detakJantung,
    String? tinggiBadan,
    String? suhuTubuh,
    String? jumlahLangkah,
    String? lajuPernafasan,
    String? catatan,
  }) async {
    final db = await instance.database;

    await db.insert('dataKesehatan', {
      'id_user': idUser,
      'tanggal': tanggal ?? DateTime.now().toIso8601String(),
      'berat_badan': beratBadan ?? '',
      'tekanan_darah': tekananDarah ?? '',
      'detak_jantung': detakJantung ?? '',
      'tinggi_badan': tinggiBadan ?? '',
      'suhu_tubuh': suhuTubuh ?? '',
      'jumlah_langkah': jumlahLangkah ?? '',
      'laju_pernafasan': lajuPernafasan ?? '',
      'catatan': catatan ?? '',
    });
  }

  Future<List<Map<String, dynamic>>> getHistoryKesehatan(int userId, int limit) async {
    final db = await instance.database;
    final result = await db.query(
      'dataKesehatan',
      where: 'id_user = ?',
      whereArgs: [
        userId
      ],
      orderBy: 'tanggal DESC',
      limit: limit,
    );
    return result;
  }

  Future<Map<String, dynamic>?> getDataKesehatanDetail(int id) async {
    final db = await instance.database;
    final result = await db.query(
      'dataKesehatan',
      where: 'id = ?',
      whereArgs: [
        id
      ],
      limit: 1,
    );

    return result.isNotEmpty ? result.first : null;
  }

  // =====================================================================
  // SCREENING RESULT (AI)
  // =====================================================================
  Future<void> insertScreeningResult({
    required int idUser,
    required String hasil,
    String? tanggal,
  }) async {
    final db = await instance.database;

    await db.insert('screening_results', {
      'id_user': idUser,
      'tanggal': tanggal ?? DateTime.now().toIso8601String(),
      'hasil': hasil,
    });
  }

  Future<List<Map<String, dynamic>>> getScreeningHistory(
    int userId, {
    int limit = 5,
  }) async {
    final db = await instance.database;

    return await db.query(
      'screening_results',
      where: 'id_user = ?',
      whereArgs: [
        userId
      ],
      orderBy: 'tanggal DESC',
      limit: limit,
    );
  }

  Future<Map<String, dynamic>?> getLastScreeningResult(int userId) async {
    final db = await instance.database;

    final result = await db.query(
      'screening_results',
      where: 'id_user = ?',
      whereArgs: [
        userId
      ],
      orderBy: 'tanggal DESC',
      limit: 1,
    );

    return result.isNotEmpty ? result.first : null;
  }

}
