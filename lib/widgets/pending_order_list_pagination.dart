import 'package:autism_project_demo_2/services/pending_order_local_json.dart';
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
  bool isLoading = false;
  LocalJsonService localJsonService = new LocalJsonService();
  ScrollController _controller;

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

  _scrollListener() async {
    if (_controller.position.extentAfter < 1600) {
      if(widget.currentPage < 3){
        print(".................${widget.currentPage}");
        List temp = await localJsonService.fetchLocalJson(
            context, (widget.currentPage + 1));
        print("${widget.currentPage}....................................");
        setState(() {
          widget.currentPage++;
          widget.data.addAll(temp);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            controller: _controller,
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == widget.data.length - 1)
                return Center(child: CircularProgressIndicator());
              else
                return pendingOrderListItem(index, widget.data);
            }));
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
        child: Column(
          children: [
            Row(
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
            Divider(),
            Row(
              children: [
                Text("Address: ",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Flexible(
                    child: Text(data[index]["OrderAddress"],
                        overflow: TextOverflow.ellipsis, maxLines: 1)),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Text("Area: ",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(data[index]["OrderArea"]),
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
                  onPressed: () {},
                  color: Colors.lightBlue,
                  child: Text('View', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(width: 10)
              ],
            )
          ],
        ),
      ),
    );
  }
}
