import 'package:get_storage/get_storage.dart';

class UseLocalStorage {
  static final UseLocalStorage _instance = UseLocalStorage._internal();

  factory UseLocalStorage() {
    return _instance;
  }

  UseLocalStorage._internal();

  final _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<K>(String key, K value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  K? readData<K>(String key) {
    return _storage.read<K>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}


/// *** *** *** *** *** Example *** *** *** *** *** ///

// LocalStorage localStorage = LocalStorage();
//
// // Save data
// localStorage.saveData('username', 'JohnDoe');
//
// // Read data
// String? username = localStorage.readData<String>('username');
// print('Username: $username'); // Output: Username: JohnDoe
//
// // Remove data
// localStorage.removeData('username');
//
// // Clear all data
// localStorage.clearAll();

