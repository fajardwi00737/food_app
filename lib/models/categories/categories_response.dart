import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse{
  bool success;
  List<Category> data;

  CategoriesResponse({this.success,this.data});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);
  Map<String,dynamic> toJson() => _$CategoriesResponseToJson(this);
}


@JsonSerializable()
class Category{
  String id;
  String desc;
  String image;

  Category({this.id,this.desc,this.image});

  factory Category.fromJson(Map<String,dynamic> json) => _$CategoryFromJson(json);
  Map<String,dynamic> toJson()=> _$CategoryToJson(this);
}