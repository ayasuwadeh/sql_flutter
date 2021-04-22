import 'package:sqflite/sqflite.dart';
import 'sqlflite_services.dart';
class PointFunctions {

  static Future<int> insert(Map<String, dynamic> row) async {

    Database db = await SQLService.instance.database;
    return await db.insert('point', row);
  }

  static Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await SQLService.instance.database;
    return await db.query('point');
  }

  static Future<int> queryRowCount() async {
    Database db = await SQLService.instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM point'));
  }

  static Future<int> update(Map<String, dynamic> row) async {
    Database db = await SQLService.instance.database;
    int id = row['_id'];
    return await db.update('point', row, where: '_id = ?', whereArgs: [id]);
  }

  static Future<int> delete(int id) async {
    Database db = await SQLService.instance.database;
    return await db.delete('point', where: '_id = ?', whereArgs: [id]);
  }

}
