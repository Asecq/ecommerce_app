import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerce/src/assets.dart';
import 'package:ecommerce/items/item.dart';

import '../home/categories.dart';
import '../home/home.dart';

class List_items extends StatefulWidget {
  @override
  _List_itemsState createState() => _List_itemsState();
}

class _List_itemsState extends State<List_items> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 30),
        child: Align(

          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 7,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: FloatingActionButton(



              onPressed: () {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false,
                );

              },
              backgroundColor: Colors.pink,
              child: Icon(Icons.home , color: Colors.white, size: 30,),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(

        automaticallyImplyLeading: false,

        actions: [

          Padding(padding: EdgeInsets.only(top: 10,left: 20)
          ,child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_forward_ios),
            ),

          ),
        ],
        leading:  Padding(padding: EdgeInsets.only(top: 10,right: 20)
          ,child: InkWell(
            child: Icon(Icons.filter_list),
          ),

        ),
        centerTitle: true,
        title:  Text(
          'القسم الفلاني',
          style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[ Color(0xFF21BFBD),  Color(0xFF1B7878),],
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child:  Container(
                    child: Column(),
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [const Color(0xFF21BFBD), const Color(0xFF1B7878),])),
                ),
              ),


              Expanded(
                child: Container(


                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 25,
                          childAspectRatio: 0.70),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => item(),
                              ),
                            );
                          },
                          child: Container(


                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(1, 2),
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(

                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.network(
                                      data[index]['image'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                               SizedBox(
                                 height: 5,
                               ),
                               Padding(padding: EdgeInsets.only(right: 10),child:  Text(data[index]['name'],
                                   style: TextStyle(
                                       fontSize: 20,
                                       fontWeight: FontWeight.w400)),),
                                SizedBox(
                                  height: 5,
                                ),
                               Padding(padding: EdgeInsets.only(right: 10),child:  Text(
                                 data[index]['price'] + ' د.ع ',
                                 style: TextStyle(
                                     fontSize: 16, fontWeight: FontWeight.w700 , color: Colors.pink),
                               ),),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}