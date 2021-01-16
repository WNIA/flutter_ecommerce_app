import 'package:autism_project_demo_2/helper/constants.dart';
import 'package:autism_project_demo_2/pages/pending_order_details_and_map_page.dart';
import 'package:autism_project_demo_2/services/pending_order_api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PendingOrderListPagination extends StatefulWidget {
  List data;
  int currentPage;

  PendingOrderListPagination(this.data, this.currentPage);

  @override
  _PendingOrderListPaginationState createState() =>
      _PendingOrderListPaginationState();
}

class _PendingOrderListPaginationState
    extends State<PendingOrderListPagination> {
  PendingOrderAPIService _apiService = new PendingOrderAPIService();
  ScrollController _controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

/*
* _scrollListener fetches more data when it reaches the end of the screen
* method for pagination
* @WNIA*/
  _scrollListener() async {
    try {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        setState(() {
          isLoading = true;
        });

        print("end scroll.............");
        List temp = await _apiService
            .fetchPendingOrderPagination(widget.currentPage + 1);
        // print("....... ${widget.currentPage}");
        setState(() {
          widget.currentPage++;
          widget.data.addAll(temp);
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  /*
  * Listview of paginated items - @WNIA
  */
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _controller,
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == widget.data.length - 1)
            return isLoading ? _overlayProgressbar() : Container();
          else
            return pendingOrderListItem(index, widget.data);
        });
  }

  _overlayProgressbar() {
    return Container(
        child: Center(
            child: CircularProgressIndicator(

            )));
  }

  pendingOrderListItem(int index, List data) {
    DateTime date = DateTime.parse(data[index]['Created']);
    String format = DateFormat('dd/MM/yyyy').format(date);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        height: 192,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 1)
            ]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: data[index]["Picture"] == null
                          ? AssetImage('assets/images/placeholder_image.png')
                          : NetworkImage(data[index]["Picture"]),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data[index]["Name"],
                            style: TextStyle(color: Colors.grey[600])),
                        Text(data[index]["MobileNumber"],
                            style: TextStyle(color: Colors.grey[600])),
                        Text(data[index]["Email"],
                            style: TextStyle(color: Colors.grey[600]))
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      child: Text('new',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.amber[900], Colors.amber[200]])),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              Divider(),
              Row(
                children: [
                  Text("Address: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Flexible(
                    child: Text(data[index]["OrderAddress"],
                        overflow: TextOverflow.ellipsis, maxLines: 1),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("Area: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Flexible(child: Text(data[index]["OrderArea"], overflow: TextOverflow.ellipsis, maxLines: 1)),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text("Order Date: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(format),
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  RaisedButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => PendingOrderDetailsPage(data[index])));

                    },
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('View', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 10)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
