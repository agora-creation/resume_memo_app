import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBController {
  static Future createUser(sql.Database database) async {
    await database.execute("""
      CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        image TEXT,
        nameRuby TEXT,
        name TEXT,
        birthDate TEXT,
        gender TEXT,
        zip TEXT,
        address TEXT,
        zip2 TEXT,
        address2 TEXT,
        tel TEXT,
        tel2 TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    """);
  }

  static Future createHistory(sql.Database database) async {
    await database.execute("""
      CREATE TABLE history(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        month TEXT,
        memo TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    """);
  }

  static Future createLicense(sql.Database database) async {
    await database.execute("""
      CREATE TABLE license(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        month TEXT,
        memo TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    """);
  }

  static Future createMotivation(sql.Database database) async {
    await database.execute("""
      CREATE TABLE motivation(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        memo TEXT,
        memo2 TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'resume.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createUser(database);
        await createHistory(database);
        await createLicense(database);
        await createMotivation(database);
      },
    );
  }

  static Future<int> insertUser() async {
    final db = await DBController.db();
    final data = {
      'image': '',
      'nameRuby': '',
      'name': '',
      'birthDate': '',
      'gender': '',
      'zip': '',
      'address': '',
      'zip2': '',
      'address2': '',
      'tel': '',
      'tel2': '',
    };
    final id = await db.insert(
      'user',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<int> insertHistory(String month, String memo) async {
    final db = await DBController.db();
    final data = {
      'month': month,
      'memo': memo,
    };
    final id = await db.insert(
      'history',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<int> insertLicense(String month, String memo) async {
    final db = await DBController.db();
    final data = {
      'month': month,
      'memo': memo,
    };
    final id = await db.insert(
      'license',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<int> insertMotivation() async {
    final db = await DBController.db();
    final data = {
      'memo': '',
      'memo2': '',
    };
    final id = await db.insert(
      'motivation',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> selectUser() async {
    final db = await DBController.db();
    return db.query('user', where: 'id = ?', whereArgs: [1], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> selectHistory() async {
    final db = await DBController.db();
    return db.query('history', orderBy: 'id DESC');
  }

  static Future<List<Map<String, dynamic>>> selectLicense() async {
    final db = await DBController.db();
    return db.query('license', orderBy: 'id DESC');
  }

  static Future<List<Map<String, dynamic>>> selectMotivation() async {
    final db = await DBController.db();
    return db.query('motivation', where: 'id = ?', whereArgs: [1], limit: 1);
  }

  static Future<int> updateUser() async {
    final db = await DBController.db();
    final data = {
      'image': '',
      'nameRuby': '',
      'name': '',
      'birthDate': '',
      'gender': '',
      'zip': '',
      'address': '',
      'zip2': '',
      'address2': '',
      'tel': '',
      'tel2': '',
    };
    final result = await db.update(
      'user',
      data,
      where: 'id = ?',
      whereArgs: [1],
    );
    return result;
  }

  static Future<int> updateHistory(int id) async {
    final db = await DBController.db();
    final data = {
      'month': '',
      'memo': '',
    };
    final result = await db.update(
      'history',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  static Future<int> updateLicense(int id) async {
    final db = await DBController.db();
    final data = {
      'month': '',
      'memo': '',
    };
    final result = await db.update(
      'license',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  static Future<int> updateMotivation() async {
    final db = await DBController.db();
    final data = {
      'memo': '',
      'memo2': '',
    };
    final result = await db.update(
      'motivation',
      data,
      where: 'id = ?',
      whereArgs: [1],
    );
    return result;
  }

  static Future deleteHistory(int id) async {
    final db = await DBController.db();
    try {
      await db.delete('history', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future deleteLicense(int id) async {
    final db = await DBController.db();
    try {
      await db.delete('license', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
