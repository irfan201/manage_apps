import 'dart:async';
import 'package:manage_apps/app/data/model/target_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String tableName = 'targets';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'targets.db');
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        category TEXT,
        weight INTEGER,
        startDate TEXT,
        endDate TEXT,
        status TEXT
      )
      ''');
  }

  Future<int> insertTarget(Target target) async {
    Database db = await this.database;
    var result = await db.insert(tableName, target.toMap());
    return result;
  }

  Future<List<Target>> getTargets() async {
    Database db = await this.database;
    var result = await db.query(tableName);
    List<Target> targets = result.isNotEmpty
        ? result.map((data) => Target.fromMap(data)).toList()
        : [];
    return targets;
  }

  Future<int> updateTarget(Target target) async {
    Database db = await this.database;
    var result = await db.update(tableName, target.toMap(),
        where: 'id = ?', whereArgs: [target.id]);
    return result;
  }

  Future<int> deleteTarget(int id) async {
    Database db = await this.database;
    var result =
        await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
