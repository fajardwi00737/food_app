import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tes_live_code/cubits/categories/categories_cubit.dart';
import 'package:flutter_tes_live_code/models/categories/categories_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  final Category categoryList;

  CategoriesList(this.categoryList);
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<CategoriesCubit>().getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Colors.grey,
              blurRadius: 2
          )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(widget.categoryList.image))
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Flexible(
            child: Container(
              child: Text(widget.categoryList.desc,maxLines: 2,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500),),
            ),
          )
        ],
      ),
    );
  }
}
