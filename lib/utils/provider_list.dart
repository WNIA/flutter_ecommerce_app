import 'package:autism_project_demo_2/services_provider//finished_deliveries_api_service.dart';
import 'package:autism_project_demo_2/services_provider//login_api_service.dart';
import 'package:autism_project_demo_2/services_provider//pending_order_api_service.dart';
import 'package:autism_project_demo_2/services_provider//processed_deliveries_api_service.dart';
import 'package:autism_project_demo_2/services_provider//processed_deliveries_details_api_service.dart';
import 'package:autism_project_demo_2/services_provider//processed_deliveries_list_api_service.dart';
import 'package:autism_project_demo_2/services_provider//profile_api_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerList() {
  return [
    ChangeNotifierProvider(create: (context) => LoginAPIService()),
    ChangeNotifierProvider(create: (context) => PendingOrderAPIService()),
    ChangeNotifierProvider(create: (context) => ProfileAPIService()),
    ChangeNotifierProvider(create: (context) => FinishedDeliveriesAPIService()),
    ChangeNotifierProvider(create: (context) => ProcessedDeliveriesAPIService()),
    ChangeNotifierProvider(create: (context) => ProcessedDeliveriesDetailsAPIService()),
    ChangeNotifierProvider(create: (context) => ProcessedDeliveriesListAPIService()),
  ];
}
