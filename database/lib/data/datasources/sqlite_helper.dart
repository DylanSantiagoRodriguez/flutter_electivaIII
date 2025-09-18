import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// SQLite holds structured, queryable data: shows, seasons, episodes, watched state, ratings.
class SqliteHelper {
  static const _dbName = 'tracker.db';
  static const _dbVersion = 2;

  Database? _db;
  final String? overrideDirectoryPath;

  SqliteHelper({this.overrideDirectoryPath});

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final String dirPath;
    if (overrideDirectoryPath != null) {
      dirPath = overrideDirectoryPath!;
    } else {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      dirPath = appDocDir.path;
    }
    final String dbPath = p.join(dirPath, _dbName);
    return openDatabase(
      dbPath,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE shows (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        type TEXT NOT NULL,
        genre TEXT NOT NULL,
        year INTEGER NOT NULL,
        average_duration_minutes INTEGER NOT NULL,
        status TEXT NOT NULL DEFAULT 'toWatch'
      )
    ''');

    await db.execute('''
      CREATE TABLE seasons (
        id INTEGER PRIMARY KEY,
        season_number INTEGER NOT NULL,
        show_id INTEGER NOT NULL,
        episodes_count INTEGER NOT NULL,
        FOREIGN KEY(show_id) REFERENCES shows(id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE episodes (
        id INTEGER PRIMARY KEY,
        episode_number INTEGER NOT NULL,
        season_id INTEGER NOT NULL,
        duration_minutes INTEGER NOT NULL,
        watched INTEGER NOT NULL DEFAULT 0,
        rating INTEGER,
        watched_at INTEGER,
        FOREIGN KEY(season_id) REFERENCES seasons(id) ON DELETE CASCADE
      )
    ''');

    // Indices for performance
    await db.execute('CREATE INDEX idx_shows_genre ON shows(genre)');
    await db.execute('CREATE INDEX idx_seasons_show ON seasons(show_id)');
    await db.execute('CREATE INDEX idx_episodes_season ON episodes(season_id)');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute("ALTER TABLE shows ADD COLUMN status TEXT NOT NULL DEFAULT 'toWatch'");
    }
  }

  Future<String> exportTo(String targetDirectoryPath) async {
    final db = await database;
    final path = db.path;
    final target = p.join(targetDirectoryPath, _dbName);
    await File(target).writeAsBytes(await File(path).readAsBytes());
    return target;
  }
}


