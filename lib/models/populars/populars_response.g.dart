// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'populars_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularsResponse _$PopularsResponseFromJson(Map<String, dynamic> json) {
  return PopularsResponse(
    success: json['success'] as bool,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Popular.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PopularsResponseToJson(PopularsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

Popular _$PopularFromJson(Map<String, dynamic> json) {
  return Popular(
    id: json['id'] as String,
    desc: json['desc'] as String,
    image: json['image'] as String,
    price: json['price'] as int,
    available: json['available'] as bool,
  );
}

Map<String, dynamic> _$PopularToJson(Popular instance) => <String, dynamic>{
      'id': instance.id,
      'desc': instance.desc,
      'image': instance.image,
      'price': instance.price,
      'available': instance.available,
    };
