import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/network_image.dart';
import 'package:ecommerce/src/assets.dart';

class CartOnePage extends StatelessWidget {
  final List<Map> items = [
    {
      "title":"المنتج الفلاني",
      "price": '10,000 د.ع',
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"

    },
    {
      "title":"المنتج الفلاني",
      "price": '10,000 د.ع',
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"

    },
    {
      "title":"المنتج الفلاني",
      "price": '10,000 د.ع',
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"

    },
    {
      "title":"المنتج الفلاني",
      "price": '10,000 د.ع',
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"

    },
    {
      "title":"المنتج الفلاني",
      "price": '10,000 د.ع',
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"

    },
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal:16.0, vertical: 30.0),
                  child: Text("سلة المشتريات", style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700
                  ),)),
             InkWell(
               onTap: (){
                 Navigator.pop(context);
               },
               child:  Container(

                   padding: EdgeInsets.symmetric(horizontal:16.0, vertical: 30.0),
                   child: Icon(Icons.arrow_forward_ios)),
             ),
            ],
          ),

            Expanded(child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index){
                return Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(5.0),
                        elevation: 3.0,
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 80,
                                child: PNetworkImage(items[index]["image"]),
                              ),
                              SizedBox(width: 10.0,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(items[index]["title"], style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(height: 20.0,),
                                    Text("\$${items[index]['price']}", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 15,
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.pinkAccent,
                          child: Icon(Icons.clear, color: Colors.white,),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                );
              },

            ),),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("المبلغ : 50,000 د.ع", style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16.0
                  ),),
                  SizedBox(height: 5.0,),
                  Text("التوصيل : 5,000 د.ع", style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16.0
                  ),),
                  SizedBox(height: 10.0,),
                  Text("السعر الكلي : 55,000 د.ع", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  SizedBox(height: 20.0,),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      height: 50.0,
                      color: Colors.pinkAccent,
                      child: Text("اكمال الطلب".toUpperCase(), style: TextStyle(
                          color: Colors.white
                      ),),
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}