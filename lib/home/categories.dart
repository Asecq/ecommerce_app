import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/src/assets.dart';
import 'package:ecommerce/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../items/list_items.dart';



class list_categories extends StatefulWidget {
  list_categories({Key? key}) : super(key: key);

  _list_categoriesState createState() => _list_categoriesState();
}

class _list_categoriesState extends State<list_categories> {
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff97136c);
  final secondary = Color(0xfff29a94);

  final List<Map> schoolLists = [
    {
      "name": "المنتج الفلاني",
      "date": "2022/06/3",
      "price": "10,000",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"
    },
    {
      "name": "المنتج الفلاني",
      "date": "2022/06/3",
      "price": "10,000",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"
    },
    {
      "name": "المنتج الفلاني",
      "date": "2022/06/3",
      "price": "10,000",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"
    },
    {
      "name": "المنتج الفلاني",
      "date": "2022/06/3",
      "price": "10,000",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"
    },
    {
      "name": "المنتج الفلاني",
      "date": "2022/06/3",
      "price": "10,000",
      "image":
      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media"

    },

  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[

              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "الاقسام",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 110),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ), itemBuilder: (BuildContext context, int index) {
                  return _buildItems(index, context);
                },
                ),),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildItems(int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      height: 200,
      child: GestureDetector(
        onTap: () =>   Navigator.of(context).push(MaterialPageRoute(builder: (context) => list_Items())),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child:Hero(

                        tag: "item$index",
                        child: PNetworkImage(images[index % images.length],
                            fit: BoxFit.cover)))),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'القسم الفلاني',
              softWrap: true,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}