import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  // Make the class static by having private constructor and static methods.
  LocalStorageService._();

  static final GetStorage _storage = GetStorage();

  /// Save data to local storage.
  static Future<void> saveData(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  /// Retrieve data from local storage.
  static T? getData<T>(String key) {
    return _storage.read<T>(key);
  }

  /// Remove data from local storage.
  static Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  /// Clear all data from local storage.
  static Future<void> clearAllData() async {
    await _storage.erase();
  }

  /// Check if a key exists in local storage.
  static bool containsKey(String key) {
    return _storage.hasData(key);
  }
}
