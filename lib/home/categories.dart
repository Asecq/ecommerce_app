import 'package:ecommerce/home/home.dart';
import 'package:ecommerce/items/list_items.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerce/src/assets.dart';
import 'package:ecommerce/items/item.dart';

class List_Categories extends StatefulWidget {
  @override
  _List_CategoriesState createState() => _List_CategoriesState();
}

class _List_CategoriesState extends State<List_Categories> {
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
          'الاقسام',
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
      backgroundColor: Colors.white,
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
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 25,
                          childAspectRatio: 0.85),
                      itemCount: data_categroies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => List_items(),
                                ),
                              );
                            },
                            child: Container(


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
                                        data_categroies[index]['image'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                               Center(
                                 child: Text(data_categroies[index]['name'],
                                     style: TextStyle(
                                         fontSize: 20,
                                         fontWeight: FontWeight.w400)),
                               ),


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
