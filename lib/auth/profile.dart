import 'package:flutter/material.dart';

import '../home/home.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);


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
        backgroundColor:  const Color(0xFF21BFBD),
        elevation: 0.0,
        actions: [
          Padding(padding: EdgeInsets.only(left: 20 , top: 10)
          ,child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_forward_ios),
            ),
          )
        ],

      ),

        backgroundColor: const Color.fromRGBO(255, 255, 255, .9),
        body: SafeArea(


          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 330,
                    color:  const Color(0xFF21BFBD),
                  ),

                  Column(
                    children: <Widget>[
                      Container(
                          height: 90,
                          margin: const EdgeInsets.only(top: 60),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor:  const Color(0xFF21BFBD),
                            child: Image.asset('assets/images/logo.png'),
                          )
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      const Text(
                        "علي محمد",
                        style:  TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      const Text(
                        "مشتري",
                        style:  TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 77),
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                      const EdgeInsets.only(top: 15, bottom: 5),
                                      child: const Text("المشتريات",
                                          style:  TextStyle(
                                              color: Colors.black54))),
                                  Container(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: const Text("32",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16))),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding:
                                      const EdgeInsets.only(top: 15, bottom: 5),
                                      child: const Text("المبلغ المصروف",
                                          style:  TextStyle(
                                              color: Colors.black54))),
                                  Container(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: const Text("120,000 د.ع ",
                                          style:  TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16))),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      const UserInfo()
                    ],
                  )
                ],
              ),
            ],
          ),
        )));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: const Text(
                      "المعلومات الشخصية",
                      style:  TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  Column(
                    children: const <Widget>[
                      ListTile(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Icon(Icons.my_location),
                        title: Text("العنوان"),
                        subtitle: Text("بغداد / الشعب"),
                      ),

                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Phone"),
                        subtitle: Text("07712710192"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}