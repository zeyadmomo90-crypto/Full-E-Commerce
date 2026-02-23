import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  StorageHelper._();

  // Singleton instance of SharedPreferences
  static late SharedPreferences _prefs;

  // Singleton instance of FlutterSecureStorage
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Initialize SharedPreferences once at app start
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    debugPrint('StorageHelper : SharedPreferences initialized');
  }

  // -------------------- SharedPreferences --------------------

  /// Set any type of value in SharedPreferences
  static void setData(String key, dynamic value) {
    debugPrint('StorageHelper : setData key=$key, value=$value');
    if (value is String) {
      _prefs.setString(key, value);
    } else if (value is int) {
      _prefs.setInt(key, value);
    } else if (value is bool) {
      _prefs.setBool(key, value);
    } else if (value is double) {
      _prefs.setDouble(key, value);
    } else if (value is List || value is Map) {
      // تحويل List أو Map إلى JSON لتخزينها
      final String jsonString = jsonEncode(value);
      _prefs.setString(key, jsonString);
    } else {
      debugPrint('StorageHelper : Unsupported type for key $key');
    }
  }

  /// Get value automatically based on its type
  static dynamic getData(String key) {
    final value = _prefs.get(key);
    debugPrint('StorageHelper : getData key=$key, value=$value');

    if (value is String) {
      try {
        final decoded = jsonDecode(value);
        if (decoded is Map || decoded is List) {
          return decoded;
        }
      } catch (e) {
        // Not a JSON string, return as String
      }
    }

    return value;
  }

  /// Remove a key from SharedPreferences
  static void removeData(String key) {
    debugPrint('StorageHelper : removeData key=$key');
    _prefs.remove(key);
  }

  /// Clear all SharedPreferences data
  static void clearAllData() {
    debugPrint('StorageHelper : clearAllData');
    _prefs.clear();
  }

  // -------------------- FlutterSecureStorage --------------------

  /// Set a secured string
  static Future<void> setSecuredString(String key, String value) async {
    debugPrint('StorageHelper : setSecuredString key=$key, value=$value');
    await _secureStorage.write(key: key, value: value);
  }

  /// Get a secured string
  static Future<String> getSecuredString(String key) async {
    final value = await _secureStorage.read(key: key) ?? '';
    debugPrint('StorageHelper : getSecuredString key=$key, value=$value');
    return value;
  }

  /// Remove a secured key
  static Future<void> removeSecuredData(String key) async {
    debugPrint('StorageHelper : removeSecuredData key=$key');
    await _secureStorage.delete(key: key);
  }

  /// Clear all secured data
  static Future<void> clearAllSecuredData() async {
    debugPrint('StorageHelper : clearAllSecuredData');
    await _secureStorage.deleteAll();
  }
}
