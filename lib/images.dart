import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'database.dart';
class DatabaseHelperImages {

  static Future<int> insertAya(Map<String, dynamic> row) async {

    Database db = await DatabaseHelper.instance.database;
    return await db.insert('aya', row);
  }

}
