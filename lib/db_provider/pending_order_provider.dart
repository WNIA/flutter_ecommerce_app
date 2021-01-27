import 'package:autism_project_demo_2/database/database_helper.dart';
import 'package:autism_project_demo_2/models/pending_order_response_model.dart';
import 'package:flutter/material.dart';

class PendingOrderProvider extends ChangeNotifier{
  List<PendingOrderData> _pendingOrderItems = [];
  List<PendingOrderData> get pendingOrderList => _pendingOrderItems;

  void addProduct(PendingOrderData data) {
    DBSQLiteHelper.insertNewPendingOrder(data).then((_) {
      _pendingOrderItems.add(data);
      notifyListeners();
    });
  }

  void fetchAllProducts() {
    DBSQLiteHelper.getAllPendingOrders().then((mapList)  {
      _pendingOrderItems = mapList.map((m) => PendingOrderData.fromMap(m)).toList();
      notifyListeners();
    });
  }

  void removeProduct(int id) {
    DBSQLiteHelper.deletePendingOrder(id).then((value) {
      _pendingOrderItems.removeWhere((data) => data.id == id);
      notifyListeners();
    });
  }

  updateDistance(int id, double value) {
    DBSQLiteHelper.updateDistance(id, value).then((_){
      //must be changed
      fetchAllProducts();
    });
  }
}