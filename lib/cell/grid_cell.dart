import 'package:flutter/material.dart';
import '../model/list.dart';

class ListCell extends StatelessWidget {
  @required
  final KlobList klobList;

  const ListCell(this.klobList);

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
                tag: "image${klobList.id}",
                child: FadeInImage.assetNetwork(
                  placeholder: "images/place_holder.png",
                  image: klobList.img,
                  width: 200,
                  height: 200,
                ),
              ))),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  klobList.name,
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
