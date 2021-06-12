import 'package:flutter/material.dart';
import '../model/list_detail.dart';

class Details extends StatefulWidget {
  final KlobDetailList klobdetaillist;
  Details({required this.klobdetaillist});

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.klobdetaillist.name),
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "image${widget.klobdetaillist.id}",
                child: FadeInImage.assetNetwork(
                    placeholder: "assets/place_holder.jpg",
                    image: widget.klobdetaillist.img),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  widget.klobdetaillist.desc,
                  maxLines: 4,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ));
  }
}
