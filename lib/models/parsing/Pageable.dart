import 'Sort.dart';

class Pageable {
  Pageable({
      this.sort, 
      this.offset, 
      this.pageNumber, 
      this.pageSize, 
      this.paged, 
      this.unpaged,});

  Pageable.fromJson(dynamic json) {
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }
  Sort? sort;
  int? offset;
  int? pageNumber;
  int? pageSize;
  bool? paged;
  bool? unpaged;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sort != null) {
      map['sort'] = sort!.toJson();
    }
    map['offset'] = offset;
    map['pageNumber'] = pageNumber;
    map['pageSize'] = pageSize;
    map['paged'] = paged;
    map['unpaged'] = unpaged;
    return map;
  }

}