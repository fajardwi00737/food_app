import 'package:flutter/material.dart';
import 'package:flutter_tes_live_code/models/populars/populars_response.dart';
import 'package:flutter_tes_live_code/screen/populars_detail.dart';

class ShowAllItem extends StatefulWidget {
  final List<Popular> popular;

  ShowAllItem(this.popular);

  @override
  _ShowAllItemState createState() => _ShowAllItemState();
}

class _ShowAllItemState extends State<ShowAllItem> {

  final _listSeeAllCategory = <ListSeeAllCategory>[
    ListSeeAllCategory(
        title: "KFC",
        rating: "4.5",
        jarak: "5 km",
        operasional: "Buka sampai jam 12.30"
    ),
    ListSeeAllCategory(
        title: "MCD",
        rating: "4.1",
        jarak: "15 km",
        operasional: "Buka sampai jam 22.30"
    ),
    ListSeeAllCategory(
        title: "Alsadda",
        rating: "4.7",
        jarak: "7 km",
        operasional: "Buka sampai jam 20.45"
    ),
    ListSeeAllCategory(
        title: "Kedai Kita",
        rating: "3.9",
        jarak: "3 km",
        operasional: "Buka sampai jam 21.20"
    ),
    ListSeeAllCategory(
        title: "Family Mart",
        rating: "5",
        jarak: "0.2 km",
        operasional: "Buka 24 jam"
    ),
    ListSeeAllCategory(
        title: "Indomart",
        rating: "4.9",
        jarak: "0.1 km",
        operasional: "Buka sampai jam 22.00"
    ),
    ListSeeAllCategory(
        title: "Alfa Mart",
        rating: "4.7",
        jarak: "0.8 km",
        operasional: "Buka 24 jam"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded,color: Colors.black,),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Container(
            child: Text("All Items",style: TextStyle(color: Colors.black),),
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: widget.popular.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PopularsDetail(widget.popular[index])));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Hero(
                                tag: "populars" + widget.popular[index].image,
                                child: Container(
                                  height: 72,
                                  width: 72,
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2
                                    )],
                                      borderRadius: BorderRadius.circular(4), color: Colors.red,
                                  image: DecorationImage(image: NetworkImage(widget.popular[index].image),fit: BoxFit.cover)
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        widget.popular[index].desc,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF212B36)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      child: Text(
                                        "Rp. ${widget.popular[index].price}",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF637381)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(
                                    blurRadius: 3,
                                    color: Colors.black45,
                                  )],
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
                          margin: EdgeInsets.only(top: 15),
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[200],
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ),
    );
  }

}

class ListSeeAllCategory {
  String title;
  String rating;
  String jarak;
  String operasional;
  ListSeeAllCategory({this.title, this.rating, this.jarak, this.operasional});
}
