import 'package:sqflite/sqflite.dart';
import 'sqlflite_services.dart';
class ImageFunctions {

  static Future<int> insert(Map<String, dynamic> row) async {

    Database db = await SQLService.instance.database;
    return await db.insert('image', row);
  }

  static Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await SQLService.instance.database;
    return await db.query('image');
  }

  static  Future<int> queryRowCount() async {
    Database db = await SQLService.instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM image'));
  }

  static Future<int> update(Map<String, dynamic> row) async {
    Database db = await SQLService.instance.database;
    int id = row['_id'];
    return await db.update('image', row, where: '_id = ?', whereArgs: [id]);
  }

  static Future<int> delete(int id) async {
    Database db = await SQLService.instance.database;
    return await db.delete('image', where: '_id = ?', whereArgs: [id]);
  }

}
