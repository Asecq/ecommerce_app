import 'package:ecommerce/home/categories.dart';
import 'package:ecommerce/items/item.dart';
import 'package:ecommerce/items/list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:ecommerce/widgets/OvalRightBorderClipper.dart';
import 'package:ecommerce/src/assets.dart'

as assets;
import 'package:ecommerce/widgets/network_image.dart';

import '../purchases/cart.dart';
final GlobalKey<ScaffoldState> _key = GlobalKey();
class Home extends StatelessWidget {
  static final String path = "lib/src/pages/misc/sliver_appbar.dart";
  final List<String> images = [
    assets.images[0],
    assets.images[1],
    assets.images[2],
    assets.images[3]
  ];
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {

    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      key: _key,
      drawer: _buildDrawer(context),

      body: Directionality(textDirection: TextDirection.rtl,child: CustomScrollView(
        slivers: <Widget>[

          SliverToBoxAdapter(

            child: _buildSlider(context),
          ),
          SliverToBoxAdapter(
            child: Container(

                color: Colors.deepOrange,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                          onPressed: () {},
                          child: Text("الاقسام".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      MaterialButton(
                          onPressed: () {
                            //list_categories
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => list_categories()));

                          },
                          child: Text("عرض الكل".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400))),
                    ],
                  ),
                )),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                  crossAxisCount: 2),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return _buildItems(index, context);
                },
                childCount: images.length,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.pink,
                child: Text("المنتجات الاكثر مبيعاً".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _buildListItem(index , context);
              },
              childCount: images.length,
            ),
          )
        ],
      ),),
    ));
  }

  Widget _buildSlider(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      height: 400.0,
      child: Stack(
        children: [

          Container(
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return  PNetworkImage(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
              itemCount: 4,
              pagination: new SwiperPagination(),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 50,left: 20),
              child: MaterialButton(
                padding: const EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Icon(Icons.search , size: 25,),
                color: Colors.black12,
                textColor: Colors.white,
                minWidth: 0,
                height: 40,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Container(

            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 50,right: 20),
              child: MaterialButton(
                padding: const EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Icon(Icons.person , size: 20,),
                color: Colors.black12,
                textColor: Colors.white,
                minWidth: 0,
                height: 40,
                onPressed: () => _key.currentState!.openDrawer(),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildItems(int index, BuildContext context) {
    return Container(
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

  Widget _buildListItem(int index , BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => item()));

      },
      child: Container(

          height: 100,
          child: Card(
            child: Center(
              child: ListTile(

                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(images[index % images.length]),
                ),
                title: Text(
                  'المنتج الفلاني',
                  softWrap: true,
                ),
                subtitle: Text(
                  '15,000 د.ع',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ),
          )),
    );
  }


  _buildDrawer(BuildContext context) {
    final String image = images[0];
    return ClipPath(
      clipper: OvalRightBorderClipper(),

      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(right: 16.0, left: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),

                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange])),
                    child:  CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.pink,
                      child:  Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "علي محمد",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "مشتري",
                    style: TextStyle(color: active, fontSize: 14.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.person_pin, "الملف الشخصي"),
                  _buildDivider(),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartOnePage()));

                    },
                    child: _buildRow(Icons.shopping_cart, "سلة المشتريات", showBadge: true ,),
                  ),
                  _buildDivider(),
                  _buildRow(Icons.shopping_bag_outlined, "مشترياتي"),
                  _buildDivider(),
                  _buildRow(Icons.notifications, "العروض"),
                  _buildDivider(),
                  _buildRow(Icons.email, "اتصل بنا"),
                  _buildDivider(),
                  _buildRow(Icons.power_settings_new, "تسجيل خروج"),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: active,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
        Spacer(),
        if (showBadge)
          Material(
            color: Colors.deepOrange,
            elevation: 5.0,
            shadowColor: Colors.red,
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                "10+",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
      ]),
    );
  }
}