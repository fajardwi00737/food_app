import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tes_live_code/models/categories/categories_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tes_live_code/main.dart';
import 'package:flutter_tes_live_code/models/categories/categories_response.dart';
import 'package:flutter_tes_live_code/models/populars/populars_response.dart';
import 'package:flutter_tes_live_code/rest_client/rest_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'populars_state.dart';

class PopularsCubit extends Cubit<PopularsState>{
  PopularsCubit(): super(PopularsInitial());

  void getPopulars(){
    try{
      emit(PopularsLoading());
      client = RestClient(Dio(BaseOptions(contentType: "application/json")));
      client.getPopulars().then((value){
        if(value.success){
          print("get categories proccess");
          emit(PopularsSuccess(value.data));
        } else {
          emit(PopularsFailed("failed get Data"));
        }
        print(value.success);
        print(value.data);
      });
    } catch (e){
      emit(PopularsError(e.toString()));
    }
  }
}