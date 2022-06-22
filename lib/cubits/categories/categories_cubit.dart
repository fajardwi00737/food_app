import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tes_live_code/main.dart';
import 'package:flutter_tes_live_code/models/categories/categories_response.dart';
import 'package:flutter_tes_live_code/rest_client/rest_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState>{
  CategoriesCubit(): super(CategoriesInitial());

  void getCategories(){
    try{
      emit(CategoriesLoading());
      client = RestClient(Dio(BaseOptions(contentType: "application/json")));
      client.getCategories().then((value){
        if(value.success){
          print("get categories proccess");
          emit(CategoriesSuccess(value.data));
        } else {
          emit(CategoriesFailed("failed get Data"));
        }
        print(value.success);
        print(value.data);
      });
    } catch (e){
      emit(CategoriesError(e.toString()));
    }
  }
}