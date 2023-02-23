import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../model/comment_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static late Database _database;

  Future<Database> get database async {
    if (_database.isOpen) {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  DatabaseHelper._internal();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'comments.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE comments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        avatar_image_url TEXT,
        name TEXT,
        time TEXT,
        comment TEXT
      )
    ''');
  }

  Future<void> insertComment(Comment comment) async {
    final db = await database;
    await db.insert('comments', comment.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Comment>> getComments() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('comments');
    return List.generate(maps.length, (i) {
      return Comment.fromMap(maps[i]);
    });
  }
}
