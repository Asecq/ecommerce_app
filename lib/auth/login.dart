
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ecommerce/auth/signup.dart';
import 'package:ecommerce/src/assets.dart';

import '../home/home.dart';

class LoginPage extends StatelessWidget {

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children:  <Widget>  [
          const SizedBox(height: 180.0,),
          const SizedBox(height: 20.0,),
          _buildLoginForm(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => SignupOnePage()
                  ));
                },
                child: const Text("انشاء حساب", style: TextStyle(color: Colors.blue, fontSize: 18.0)),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildLoginForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Directionality(textDirection: TextDirection.rtl,child: Stack(
        children: <Widget>[

          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  const SizedBox(height: 90.0,),
                  Container(
                    child:   Text(NameStore.toString() , style: const  TextStyle(
                        color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18

                    ),),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: const TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "رقم الهاتف",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: const Icon(Icons.email, color: Colors.blue,)
                        ),
                      )
                  ),

                  Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: const TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "كلمة السر",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: const Icon(Icons.lock, color: Colors.blue,)
                        ),
                      )
                  ),
                  Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),

                  const SizedBox(height: 10.0,),

                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.pink,
                child:  Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
          Container(
            height: 420,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
                  },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                color: Colors.blue,
                child: const Text("تسجيل دخول", style:  TextStyle(color: Colors.white70)),
              ),
            ),
          )
        ],
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}