import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../home/home.dart';


class CartThreePage extends StatefulWidget {

  @override
  _CartThreePageState createState() => _CartThreePageState();
}
var data = '[{"name": " المنتج الفلاني تجريبي " , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"},'
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}'
    ','
    '{"name": " المنتج الفلاني تجريبي تجريبي" , "price": "1000" ,  "count": "1" ,"image":"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F3.jpg?alt=media"}]';

List items = [];
int total  = 0;

var number = 0;
class _CartThreePageState extends State<CartThreePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.clear();
    if(items.isEmpty || items.length == 0) {
      var  list_items = json.decode(data);
      items = list_items;
      items.forEach((item) {
        total += int.parse(item['price']);

      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(

      backgroundColor: const Color(0xFF21BFBD),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF21BFBD),
        elevation: 0.0,
        actions:  [
          Padding(padding: EdgeInsets.only(left: 25,top: 10)
          ,child: InkWell(
                child: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.pop(context);
                },
              )
          )
        ],
      ),
      body: ListView(
          physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: const <Widget>[
                SizedBox(width: 10.0),
                Text('سلة المشتريات',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400
                    ))
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,

                        child: ListView.builder(
                          itemCount: items.length,

                            itemBuilder: (c ,index){
                          return _buildFoodItem(items[index]['image'], items[index]['name'], items[index]['price'] , index);
                        }

                        ))),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    color:  Color(0xFF1B7878),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        total.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') + ' د.ع ',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18.0),
                      ),
                      const SizedBox(width: 20.0),
                      Spacer(),
                      RaisedButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {},
                        color: Color(0xFF21BFBD),
                        textColor: Colors.white,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            Text("اكمال الطلب",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              color: Colors.white

                            ),),
                            const SizedBox(width: 20.0),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.cyan,
                                size: 16.0,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10.0)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildFoodItem(String imgPath, String itemname, String price,int index ) {
    int number = int.parse(items[index]['count']);
    int price = int.parse(items[index]['price']);
    var last_price  =  price * number;




    return Dismissible(
      direction: DismissDirection.startToEnd,
      resizeDuration: Duration(milliseconds: 200),
      key: UniqueKey(),

      onDismissed: (direction) {

        print("deleted");
        items.removeAt(index);
        // TODO: implement your delete function and check direction if needed

        setState(() {
          total -= last_price;
        });
        print(total);
      },
      background: Container(
        padding: EdgeInsets.only(left: 28.0),
        alignment: AlignmentDirectional.centerStart,
        color: Colors.red,
        child: Icon(Icons.delete_forever, color: Colors.white,),
      ),
      // secondaryBackground: ...,
      child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Row(children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 1, color: Colors.black12),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: imgPath,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) => SpinKitWave(
                              size: 40,
                              itemBuilder: (BuildContext context, int index) {


                                return const DecoratedBox(

                                  decoration: const BoxDecoration(
                                    color: Colors.white54,
                                  ),
                                );
                              },
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                itemname,

                                maxLines: 1,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              Text(last_price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') + ' د.ع ',
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey)),

                            ])
                      ])),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.add ),
                          color: Colors.black,
                          onPressed: () {
                            number += 1;

                            total += price;
                            setState(() {

                              items[index]['count'] = number.toString();
                            });
                            print(last_price);
                          }),
                      Text(items[index]['count'] , style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      (number != 1)? IconButton(
                          icon: const Icon(Icons.minimize ),
                          color: Colors.black,
                          onPressed: () {
                            number -= 1 ;
                            total -= price;
                            setState(() {

                              items[index]['count'] = number.toString();
                            });
                            print(last_price);

                          }) :
                      IconButton(
                          icon: const Icon(Icons.minimize , color: Colors.black12 ),
                          color: Colors.black,
                          onPressed: () {
                          }),
                    ],
                  ),

                ],
              ))),
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    items.clear();
    total = 0;
  }

}
/*

 */