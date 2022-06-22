import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tes_live_code/cubits/categories/categories_cubit.dart';
import 'package:flutter_tes_live_code/cubits/populars/populars_cubit.dart';
import 'package:flutter_tes_live_code/models/populars/populars_response.dart';
import 'package:flutter_tes_live_code/models/populars/populars_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularsList extends StatefulWidget {
  final Popular popular;
  //
  PopularsList(this.popular);
  @override
  _PopularsListState createState() => _PopularsListState();
}

class _PopularsListState extends State<PopularsList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 160,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Colors.grey,
              blurRadius: 2
          )]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "populars" + widget.popular.image,
            child: Container(
              height: 97,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: NetworkImage(widget.popular.image),fit: BoxFit.cover)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(6),
            child: Text(widget.popular.desc,maxLines: 2,textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w500),),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 6, bottom: 6),
                child: Text("Rp. ${widget.popular.price}",maxLines: 2,textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.grey[500]),),
              ),
              Spacer(),
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(right: 8,bottom: 8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green[300]
                ),
                child: Center(
                  child: Icon(Icons.shopping_cart_sharp,color: Colors.white,size: 15,),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
