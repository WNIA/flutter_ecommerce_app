import 'package:autism_project_demo_2/models/pending_order_response_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DBSQLiteHelper {
  static final String _CREATE_TABLE_PENDING_ORDER_DATA =
      '''create table $TABLE_PENDING_ORDER_DATA(
$COL_PENDING_ORDER_DATA_ID integer primary key autoincrement,
$COL_PENDING_ORDER_DATA_SHOP_ID integer  not null,
$COL_PENDING_ORDER_DATA_CUSTOMER_ID integer  not null,
$COL_PENDING_ORDER_DATA_CREATED text not null,
$COL_PENDING_ORDER_DATA_ORDER_ADDRESS text not null,
$COL_PENDING_ORDER_DATA_ORDER_LATITUDE real not null,
$COL_PENDING_ORDER_DATA_ORDER_LONGITUDE real not null,
$COL_PENDING_ORDER_DATA_ORDER_AREA text not null,
$COL_PENDING_ORDER_DATA_NAME text not null,
$COL_PENDING_ORDER_DATA_MOBILE_NUMBER text not null,
$COL_PENDING_ORDER_DATA_EMAIL text not null,
$COL_PENDING_ORDER_DATA_PICTURE text not null,
$COL_PENDING_ORDER_DATA_DISTANCE real not null,
)''';

  static Future<Database> _open() async {
    final String root = await getDatabasesPath();
    final dbPath = Path.join(root, 'pending_order_data.db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(_CREATE_TABLE_PENDING_ORDER_DATA);
    });
  }

  static Future<int> insertNewPendingOrder(PendingOrderData data) async {
    final db = await _open();
    return db.insert(TABLE_PENDING_ORDER_DATA, data.toMap());
  }

  static Future<List<Map<String, dynamic>>> getAllPendingOrders() async {
    final db = await _open();
    return db.query(TABLE_PENDING_ORDER_DATA);
  }

  static Future<int> deletePendingOrder(int id) async {
    final db = await _open();
    return db
        .delete(TABLE_PENDING_ORDER_DATA, where: '$COL_PENDING_ORDER_DATA_ID = ?', whereArgs: [id]);
  }

  static Future<int> updateDistance(int id, double value) async {
    final db = await _open();
    return db.update(TABLE_PENDING_ORDER_DATA, {COL_PENDING_ORDER_DATA_DISTANCE: value}, where: '$COL_PENDING_ORDER_DATA_ID = ?', whereArgs: [id]);
  }

}
