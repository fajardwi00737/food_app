import 'package:json_annotation/json_annotation.dart';

part 'populars_response.g.dart';

@JsonSerializable()
class PopularsResponse{
  bool success;
  List<Popular> data;

  PopularsResponse({this.success, this.data});

  factory PopularsResponse.fromJson(Map<String,dynamic> json) => _$PopularsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PopularsResponseToJson(this);
}

@JsonSerializable()
class Popular{
  String id;
  String desc;
  String image;
  int price;
  bool available;

  Popular({this.id,this.desc,this.image,this.price,this.available});

  factory Popular.fromJson(Map<String, dynamic> json) => _$PopularFromJson(json);
  Map<String, dynamic> toJson() => _$PopularToJson(this);
}