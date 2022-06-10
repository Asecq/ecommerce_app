import 'package:flutter/material.dart';
import 'package:ecommerce/src/assets.dart';
import 'package:ecommerce/widgets/network_image.dart';

import '../home/home.dart';

class item extends StatelessWidget {
  final String image = images[1];
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              child: PNetworkImage(
                image,
                fit: BoxFit.cover,
              )),
          SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Container(),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10,left: 20),
                          child: MaterialButton(
                            padding: const EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Icon(Icons.arrow_forward_ios , size: 25,),
                            color: Colors.black38,
                            textColor: Colors.white,
                            minWidth: 0,
                            height: 40,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 30.0),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text(
                                      "المنتج الفلاني",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Text(
                                      "وصف بسيط للمنتج وصف بسيط للمنتج وصف بسيط للمنتج وصف بسيط للمنتج وصف بسيط للمنتج وصف بسيط للمنتج ",style: TextStyle(
                                        color: Colors.grey.shade600
                                    ),),
                                  ),
                                  ExpansionTile(
                                    title: const Text("عرض تفاصيل اكثر",style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text("تفاصيل اكثر عن المنتج تفاصيل اكثر عن المنتج  تفاصيل اكثر عن المنتج تفاصيل اكثر عن المنتج "),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(32.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                              color: Colors.grey.shade900,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "15,00 د.ع",
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
                                  color: Colors.orange,
                                  textColor: Colors.white,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text("اضافة الى السلة",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0
                                      ),),
                                      const SizedBox(width: 20.0),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.orange,
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
                    ),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}