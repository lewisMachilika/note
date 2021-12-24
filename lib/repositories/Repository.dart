import 'package:sqflite/sqflite.dart';

import 'DatabaseConnection.dart';

class Repository{
  late DatabaseConnection _databaseConnection;
  Repository(){
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database> get database async{
    if (_database!=null) return _database!;
    _database = await _databaseConnection.setDatabase();
    return _database!;
  }
  insertData(String table, Map<String, Object?> values)async{
    var connection = await database;
    return await connection.insert(table, values);
  }
  updateData(String table, Map<String, Object?> values,int id)async{
    var connection = await database;
    return await connection.update(table, values,where: "id = ?",whereArgs: [id]);
  }
  readData(table)async{
    var connection = await database;
    return await connection.query(table);
  }
  deleteData(table,code)async{
    var connection = await database;
    return await connection.delete(table,where: "id = ?",whereArgs: [code]);
    //return await connection.execute("Delete from ? where id = ? ",[table,code]);

  }
}