import 'package:hive_flutter/hive_flutter.dart';
import 'package:moti/utils/keys.dart';

class DBService {
  DBService._();

  static DBService instance = DBService._();

  Future<bool> store(String key, String value) async {
    final Keys k = Keys.instance;
    final db = await Hive.openBox(k.db);
    try {
      await db.put(key, value);
      return true;
    } catch(e) {
      print(e);
      return false;
    }
  }

  Future<T?> receive<T>(String key) async {
      final Keys k = Keys.instance;
      final db = await Hive.openBox(k.db);
    try{
      T? res = await db.get(key);
      return res;
    } catch(e) {
      print(e);
      return null;
    }
  }
}