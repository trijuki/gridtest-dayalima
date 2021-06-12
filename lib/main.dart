import 'package:gridtest/detail_list.dart';
import '../cell/grid_cell.dart';
import '../model/list.dart';
import '../network/network_request.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klob',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List data;

  gridView(AsyncSnapshot<List<KlobList>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data!.map((kloblist) {
          return GestureDetector(
              child: GridTile(
                child: ListCell(kloblist),
              ),
              onTap: () {
                goToDetailpage(context, kloblist);
              });
        }).toList(),
      ),
    );
  }

  goToDetailpage(BuildContext context, KlobList klobList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext contex) => DetailList(kloblist: klobList)));
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
          title: Text("Klob"),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: FutureBuilder<List<KlobList>>(
                    future: NetworkRequest.fetchList(),
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
