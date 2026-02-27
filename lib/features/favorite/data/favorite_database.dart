import 'package:path/path.dart';
import 'package:ppp/features/favorite/data/model/favorite_model.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDatabase {
  final tableName = 'favorite';
  FavoriteDatabase._internal();
  static final FavoriteDatabase _instance = FavoriteDatabase._internal();
  factory FavoriteDatabase() => _instance;

  Database? favoriteDatabase;

  Future<Database> get myDatabase async {
    if (favoriteDatabase != null) return favoriteDatabase!;
    favoriteDatabase = await init();
    return favoriteDatabase!;
  }

  Future<Database> init() async {
    const myPath = 'favorite.db';
    final myDatabase = await getDatabasesPath();
    final path = join(myDatabase, myPath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, title TEXT, quantity INTEGER, price INTEGER, images TEXT)',
        );
      },
    );
  }

  Future<void> insert(FavoriteModel model) async {
    final Database db = await myDatabase;
    await db.insert(
      tableName,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(FavoriteModel model) async {
    final Database db = await myDatabase;
    await db.update(
      tableName,
      model.toJson(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> delete(int id) async {
    final Database db = await myDatabase;
    await db.delete(tableName, where: 'id=?', whereArgs: [id]);
  }

  Future<List<FavoriteModel>> getFavoriteProducts() async {
    final Database db = await myDatabase;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((item) => FavoriteModel.fromJson(item)).toList();
  }
}
