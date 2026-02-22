import 'package:path/path.dart';
import 'package:ppp/features/cart/data/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Singleton pattern
  DatabaseHelper._internal();
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static const String tableName = 'cartProducts';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  static Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    const myDatabaseName = 'cart.db';
    final path = join(databasePath, myDatabaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, price INTEGER, images TEXT, quantity INTEGER)''',
        );
      },
    );
  }

  Future<void> insertToCart(CartModel cartModel) async {
    final Database db = await database;
    await db.insert(
      tableName,
      cartModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ); // دي لما تستدعيها هيطلب الموديل هتديله بقي البيانات من غير id
  }

  Future<List<CartModel>> getCart() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((item) => CartModel.fromJson(item)).toList();
  }

  Future<void> updatedCart(CartModel cartModel) async {
    final Database db = await database;
    await db.update(
      tableName,
      cartModel.toJson(),
      where: 'id = ?',
      whereArgs: [cartModel.id],
    ); // دي لما تستدعيها هيطلب الموديل هتديله بقي البيانات بال id
  }

  Future<void> deleteFromCart(int id) async {
    final Database db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  } // دي لما تستدعيها هيطلب الموديل هتديله بقي البيانات بال id
}
