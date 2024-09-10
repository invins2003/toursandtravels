// storage_utility.dart
import 'package:get_storage/get_storage.dart';

class StorageUtility {
  static final GetStorage _storage = GetStorage();

  // Initialize the storage
  static Future<void> init() async {
    await GetStorage.init();
  }

  // Set a value
  static Future<void> setValue(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  // Get a value
  static dynamic getValue(String key, {dynamic defaultValue}) {
    return _storage.read(key) ?? defaultValue;
  }

  // Remove a value
  static Future<void> removeValue(String key) async {
    await _storage.remove(key);
  }

  // Clear all values
  static Future<void> clearAll() async {
    await _storage.erase();
  }
}
