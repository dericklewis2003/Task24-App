import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, timeSlot TEXT)',
        );
      },
    );
  }

  Future<void> insertTask(String description, String timeSlot) async {
    final db = await database;
    await db.insert('tasks', {
      'description': description,
      'timeSlot': timeSlot,
    });
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;
    return await db.query('tasks');
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  // New method to get events for a specific date
  Future<List<Map<String, dynamic>>> getTasksForDate(DateTime date) async {
    final db = await database;
    String formattedDate =
        date.toIso8601String().split("T").first; // Format date to 'YYYY-MM-DD'
    return await db
        .query('tasks', where: 'timeSlot = ?', whereArgs: [formattedDate]);
  }
}
