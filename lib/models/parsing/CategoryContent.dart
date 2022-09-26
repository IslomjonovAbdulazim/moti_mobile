class CategoryContent {
  CategoryContent({
      this.id, 
      this.name, 
      this.parentId, 
      this.iconUrl,});

  CategoryContent.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parentId'];
    iconUrl = json['iconUrl'];
  }
  int? id;
  String? name;
  dynamic parentId;
  dynamic iconUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['parentId'] = parentId;
    map['iconUrl'] = iconUrl;
    return map;
  }

}