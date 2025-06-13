import 'package:hidup_fit/data/models/article.dart';
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

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'app.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            name TEXT,
            password TEXT,
            tanggal_lahir TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE articles(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            imageUrl TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(String name, String tanggalLahir, String username, String password) async {
    final db = await instance.database;
    await db.insert('users', {
      'name': name,
      'tanggal_lahir': tanggalLahir,
      'username': username,
      'password': password,
    });
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    final db = await instance.database;
    final result = await db.query('users', where: 'username = ? AND password = ?', whereArgs: [
      username,
      password
    ]);
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String, dynamic>?> getUserByUsername(String username) async {
    final db = await instance.database;
    final result = await db.query('users', where: 'username = ?', whereArgs: [
      username
    ]);
    return result.isNotEmpty ? result.first : null;
  }

  static Future<void> insertArticle(Article article) async {
    final db = await instance.database;
    await db.insert('articles', article.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Article>> getArticles() async {
    final db = await instance.database;
    final maps = await db.query('articles');
    return List.generate(maps.length, (i) => Article.fromMap(maps[i]));
  }
}
