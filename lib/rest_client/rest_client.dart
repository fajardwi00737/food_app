import 'package:flutter_tes_live_code/models/categories/categories_response.dart';
import 'package:flutter_tes_live_code/models/populars/populars_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

// @RestApi(baseUrl: "https://mocki.io/v1/")
@RestApi(baseUrl: "https://mocki.io/v1/")

abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("4f6c484b-2920-4474-a17f-cf3bc5fe2e62")
  Future<CategoriesResponse> getCategories();

  @GET("b7bfbfbb-a366-4e25-a8a6-7e9f20feed80")
  Future<PopularsResponse> getPopulars();
}