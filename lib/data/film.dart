class DataModel {
  DataModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.type,
      this.rating});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json[0];
    name = json[1];
    image = json[2];
    type = json[3];
    rating = json[4];
  }

  int? id;
  String? name;
  String? image;
  String? type;
  int? rating;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['titre'] = name;
    data['file'] = image;
    data['id'] = type;
    data['id'] = rating;
    return data;
  }
}
