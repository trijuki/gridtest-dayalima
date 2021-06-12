import 'package:flutter/material.dart';
import '../model/list_detail.dart';

class ListDetailCell extends StatelessWidget {
  @required
  final KlobDetailList klobDetailList;

  const ListDetailCell(this.klobDetailList);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: ClipRect(
                      child: Hero(
                tag: "image${klobDetailList.id}",
                child: FadeInImage.assetNetwork(
                  placeholder: "images/place_holder.png",
                  image: klobDetailList.img,
                  width: 200,
                  height: 200,
                ),
              ))),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  klobDetailList.name,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
