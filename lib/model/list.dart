class KlobList {
  int id = 0;
  String name = "";
  String img = "";
  String listData = "";

  KlobList(
      {required this.id,
      required this.name,
      required this.img,
      required this.listData});

  KlobList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    listData = json['listData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['listData'] = this.listData;
    return data;
  }
}
