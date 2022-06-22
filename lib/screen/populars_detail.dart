import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tes_live_code/models/populars/populars_response.dart';

class PopularsDetail extends StatefulWidget {
  final Popular popular;

  PopularsDetail(this.popular);
  @override
  _PopularsDetailState createState() => _PopularsDetailState();
}

class _PopularsDetailState extends State<PopularsDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  child: Hero(tag: "populars" + widget.popular.image, child: Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(widget.popular.image),fit: BoxFit.cover)
                    ),
                  )),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6),
                        child: Text(widget.popular.desc,maxLines: 2,textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(left: 6, bottom: 6),
                        child: Text("Rp. ${widget.popular.price}",maxLines: 2,textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.grey[500]),),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[300],
                        onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: Text("Masukkan ke keranjang",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                    onPressed: (){

                    },
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Icon(Icons.arrow_back_rounded,size: 30,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
