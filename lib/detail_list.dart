import 'package:flutter/material.dart';
import 'package:gridtest/cell/grid_detail_cell.dart';
import '../model/list_detail.dart';
import '../model/list.dart';
import '../network/network_request.dart';
import 'package:gridtest/detail.dart';

class DetailList extends StatefulWidget {
  final KlobList kloblist;
  DetailList({required this.kloblist});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<DetailList> {
  gridView(AsyncSnapshot<List<KlobDetailList>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data!.map((klobDetailList) {
          return GestureDetector(
              child: GridTile(
                child: ListDetailCell(klobDetailList),
              ),
              onTap: () {
                goToDetailpage(context, klobDetailList);
              });
        }).toList(),
      ),
    );
  }

  goToDetailpage(BuildContext context, KlobDetailList klobDetailList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext contex) =>
                Details(klobdetaillist: klobDetailList)));
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Klob ${widget.kloblist.listData}"),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: FutureBuilder<List<KlobDetailList>>(
                    future:
                        NetworkRequest.fetchDetail(widget.kloblist.listData),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text('Error ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return gridView(snapshot);
                      }

                      return circularProgress();
                    })),
          ],
        ));
  }
}
