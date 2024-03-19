
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'database_cruid.db');
    return await openDatabase(databasePath);
  }

  Future<bool> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database_cruid.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database', 'database_cruid.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      return true;
    }
    return false;
  }

  Future<List<Map<String,dynamic>>> getDetail() async {
    Database db = await initDatabase();
    List<Map<String,dynamic>> userList = await db.rawQuery('Select * from Tbl_User');
    return userList;

  }

  Future<int> addData(Map<String, dynamic> map) async {
    Database db= await initDatabase();
    int noOfRaw = await db.insert("Tbl_User", map);
    return noOfRaw;
  }

  Future<int> delete(int id) async {
    Database db= await initDatabase();
    int noOfRaw = await db.delete('Tbl_User',where: 'UserId = ?',whereArgs: [id]);
    return noOfRaw;
  }

  Future<int> updateData(Map<String, dynamic> map) async {
    Database db= await initDatabase();
    int noOfRaw = await db.update('Tbl_User',map,where: 'UserId = ?',whereArgs: [map['UserId']]);
    return noOfRaw;
  }
}