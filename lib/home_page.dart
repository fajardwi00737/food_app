import 'package:flutter/material.dart';
import 'package:flutter_tes_live_code/cubits/categories/categories_cubit.dart';
import 'package:flutter_tes_live_code/cubits/populars/populars_cubit.dart';
import 'package:flutter_tes_live_code/models/categories/categories_response.dart';
import 'package:flutter_tes_live_code/models/populars/populars_response.dart';
import 'package:flutter_tes_live_code/screen/category_List.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tes_live_code/screen/popular_list.dart';
import 'package:flutter_tes_live_code/screen/populars_detail.dart';
import 'package:flutter_tes_live_code/screen/show_all_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Popular> popular = [];

  @override
  void initState() {
    // TODO: implement initState
    context.read<CategoriesCubit>().getCategories();
    context.read<PopularsCubit>().getPopulars();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 16,right: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Container(
                            child: Text("Hi, Fajar",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey),),
                          ),
                          Container(
                            child: Text("Good Night",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                          ),
                        ],),
                      ),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green[300]
                        ),
                        child: Center(
                          child: Icon(Icons.shopping_cart_sharp,color: Colors.white,size: 20,),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16,),
                  height: 40,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      border: Border.all(
                        color: Color(0xFFDFE3E8),
                      ),
                      color: Color(0xFFF8F8F8)),
                  child: InkWell(
                    onTap: () {
                      print("object");
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                            flex: 1,
                            child: Icon(Icons.search)),
                        Flexible(
                          flex: 15,
                          child: Container(
                            margin: EdgeInsets.only(left: 12),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              onTap: () {
                                print("object");

                              },
                              readOnly: true,
                              style: TextStyle(
                                  fontSize: 13,),
                              buildCounter: (BuildContext context,
                                  {int currentLength,
                                    int maxLength,
                                    bool isFocused}) =>
                              null,
                              maxLength: 160,
                              decoration: InputDecoration(
                                isCollapsed: true,
                                border: InputBorder.none,
                                hintText:
                                "What you wanna eat/drink today ?",
                                hintStyle: TextStyle(
                                    fontSize: 13,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(image: NetworkImage("https://blog.dineout-cdn.co.in/blog/wp-content/uploads/2018/05/BANNER-1-1-1030x538.png"),
                          fit: BoxFit.cover)
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Categories",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                      Spacer(),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (contenx) => ShowAllItem(popular)));
                          },
                          child: Text("View All Items",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.amber))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                BlocConsumer<CategoriesCubit, CategoriesState>(
                  listener: (_, state){
                    if(state is CategoriesFailed){
                      print(state.failedMessage);
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (_, state){
                    if(state is CategoriesLoading){
                      //Loading
                      print("Loading");
                      return Center(
                        child: SizedBox(width: 50,
                            height: 50,child: CircularProgressIndicator()),
                      );
                    } else if(state is CategoriesSuccess){
                      //success
                      print(state.categoriesData);
                      return Container(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: state.categoriesData.length,
                            itemBuilder: (_, index){
                              return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (contenx) => ShowAllItem(popular)));
                                  },
                                  child: CategoriesList(state.categoriesData[index]));
                              // return categoryWidget(state.categoriesData[index]);
                            }
                        ),
                      );
                    } else if (state is CategoriesError){
                      //error
                      print(state.errorMessage);
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 16,),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Popular Now",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                      Spacer(),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (contenx) => ShowAllItem(popular)));
                          },
                          child: Text("View All",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.amber))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                BlocConsumer<PopularsCubit,PopularsState>(
                    listener: (_, state){
                      if(state is PopularsFailed){
                        print(state.failedMessage);
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Container(
                              color: Colors.red,
                            ),
                          ),
                        );
                      }
                    },
                    builder: (_, state){
                      if(state is PopularsLoading){
                        //Loading
                        print("Loading");
                        return Center(
                          child: SizedBox(width: 50,
                              height: 50,child: CircularProgressIndicator()),
                        );
                      } else if(state is PopularsSuccess){
                        popular = state.popularsData;
                        //success
                        print(state.popularsData);
                        return Container(
                          height: 190,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.popularsData.length,
                              itemBuilder: (_, index){
                                return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PopularsDetail(state.popularsData[index])));
                                    },
                                    child: PopularsList(state.popularsData[index]));
                                // return categoryWidget(state.categoriesData[index]);
                              }
                          ),
                        );
                      } else if (state is PopularsError){
                        //error
                        print(state.errorMessage);
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Container(
                              color: Colors.red,
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Container(
                              color: Colors.red,
                            ),
                          ),
                        );
                      }
                    }
                ),
                SizedBox(
                  height: 16,
                ),
                // CategoriesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
