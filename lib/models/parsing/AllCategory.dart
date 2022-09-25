import 'CategoryContent.dart';
import 'Pageable.dart';
import 'Sort.dart';

class AllCategory {
  AllCategory({
      this.content, 
      this.pageable, 
      this.totalPages, 
      this.totalElements, 
      this.last, 
      this.number, 
      this.sort, 
      this.size, 
      this.numberOfElements, 
      this.first, 
      this.empty,});

  AllCategory.fromJson(dynamic json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content!.add(CategoryContent.fromJson(v));
      });
    }
    pageable = json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    size = json['size'];
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }
  List<CategoryContent>? content;
  Pageable? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? number;
  Sort? sort;
  int? size;
  int? numberOfElements;
  bool? first;
  bool? empty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (content != null) {
      map['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      map['pageable'] = pageable!.toJson();
    }
    map['totalPages'] = totalPages;
    map['totalElements'] = totalElements;
    map['last'] = last;
    map['number'] = number;
    if (sort != null) {
      map['sort'] = sort!.toJson();
    }
    map['size'] = size;
    map['numberOfElements'] = numberOfElements;
    map['first'] = first;
    map['empty'] = empty;
    return map;
  }

}