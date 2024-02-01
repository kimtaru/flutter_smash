import 'package:flutter_app_base/common/data/preference/item/preference_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String prefix = 'AppPreference.';
  static late final SharedPreferences _prefs;

  static String getPrefKey(PreferenceItem item) {
    return '${AppPreferences.prefix}${item.key}';
  }

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    return;
  }

  static bool checkIsNullable<T>() => null is T;

  static Future<bool> setValue<T>(PreferenceItem<T> item, T? value) async {
    final String key = getPrefKey(item);
    final isNullable = checkIsNullable<T>();

    if (isNullable && value == null) {
      return _prefs.remove(item.key);
    }

    if (isNullable) {
      switch (T.toString()) {
        case "int?":
          return _prefs.setInt(key, value as int);
        case "String?":
          return _prefs.setString(key, value as String);
        case "double?":
          return _prefs.setDouble(key, value as double);
        case "bool?":
          return _prefs.setBool(key, value as bool);
        case "List<String>?":
          return _prefs.setStringList(key, value as List<String>);
        case "DateTime?":
          return _prefs.setString(key, (value as DateTime).toIso8601String());
        default:
          if (value is Enum) {
            return _prefs.setString(key, value.name);
          } else {
            throw Exception('$T 타입에 대한 저장 transform 함수를 추가해야 합니다.');
          }
      }
    } else {
      switch (T.toString()) {
        case "int":
          return _prefs.setInt(key, value as int);
        case "String":
          return _prefs.setString(key, value as String);
        case "double":
          return _prefs.setDouble(key, value as double);
        case "bool":
          return _prefs.setBool(key, value as bool);
        case "List<String>":
          return _prefs.setStringList(key, value as List<String>);
        case "DateTime":
          return _prefs.setString(key, (value as DateTime).toIso8601String());
        default:
          if (value is Enum) {
            return _prefs.setString(key, value.name);
          } else {
            throw Exception('$T 타입에 대한 저장 transform 함수를 추가해야 합니다.');
          }
      }
    }
  }

  static Future<bool> deleteValue<T>(PreferenceItem<T> item) async {
    final String key = getPrefKey(item);
    return _prefs.remove(key);
  }

  static T getValue<T>(PreferenceItem<T> item) {
    final String key = getPrefKey(item);
    switch (T) {
      case int:
        return _prefs.getInt(key) as T? ?? item.defaultValue;
      case String:
        return _prefs.getString(key) as T? ?? item.defaultValue;
      case double:
        return _prefs.getDouble(key) as T? ?? item.defaultValue;
      case bool:
        return _prefs.getBool(key) as T? ?? item.defaultValue;
      case const (List<String>):
        return _prefs.getStringList(key) as T? ?? item.defaultValue;
      default:
        return _prefs.getString(key) as T? ?? item.defaultValue;
    }
  }
}
