class Sort {
  Sort({
      this.empty, 
      this.sorted, 
      this.unsorted,});

  Sort.fromJson(dynamic json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['empty'] = empty;
    map['sorted'] = sorted;
    map['unsorted'] = unsorted;
    return map;
  }

}