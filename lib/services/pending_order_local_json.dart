
import 'package:autism_project_demo_2/models/pending_order_response_model.dart';
import 'package:flutter/cupertino.dart';

class LocalJsonService{
  Future<List> fetchLocalJson(BuildContext context, int page) async{
    String json = await DefaultAssetBundle.of(context).loadString("assets/json/pending_order_${page}.json");
    PendingOrderResponseModel responseModel = pendingOrderResponseFromJson(json);
    List data = new List();
    int length = responseModel.data.length;
    for(int i = 0; i < length; i++){
      data.add(responseModel.data[i].toJson());
    }
    return data;
  }
}