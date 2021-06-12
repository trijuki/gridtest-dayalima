class KlobDetailList {
  String id = "";
  String name = "";
  String desc = "";
  String img = "";

  KlobDetailList(
      {required this.id,
      required this.name,
      required this.desc,
      required this.img});

  KlobDetailList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['img'] = this.img;
    return data;
  }
}
