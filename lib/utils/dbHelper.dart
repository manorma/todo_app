import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

import 'package:todo_app/model/todo.dart';

class DbHelper{


  static final DbHelper _dbHelper = DbHelper._internal();
  String tblTodo ="todo";
  String colId ="id";
  String colDescription = "description";
  String colTitle = "title";
  String colPriority = "priority";
  String colDate ="date";

  DbHelper._internal();

  //factory to return the same instance of class
  factory DbHelper(){
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async{
    if(_db == null){
      _db = await initializeDab();
    }

    return _db;
  }



  Future<Database> initializeDab() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todo.db";
    var dbTodos = await openDatabase(path,version: 1,onCreate: _createDb);
    return dbTodos;

  }

  void _createDb(Database db,int newVersion) async {
    await db.execute(
      "CREATE TABLE $tblTodo($colId INTEGER_PRIMARY_KEY,$colTitle TEXT,"+
    "$colDescription TEXT, $colPriority INTEGER, $colDate TEXT )"
    );

  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert(tblTodo, todo.toMap());
    return result; // return id of record , if return 0 means something went wrong
  }

  Future<List> getTodos() async {
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * from $tblTodo order by $colPriority ASC");
    return result;
  }

  Future<int> getCount() async{
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
      await db.rawQuery("select count (*) from $tblTodo")
    );

    return result;
  }

  Future<int> updateTodo(Todo todo) async{
    Database db = await this.db;
    var result = await db.update(tblTodo, todo.toMap(), where: "$colId = ?",whereArgs: [todo.id]);
    return result;
  }


  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("DELETE FROM $tblTodo where $colId = $id");
    return result;
  }
}