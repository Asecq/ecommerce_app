import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class PNetworkImage extends StatelessWidget {
  final String? image;
  final BoxFit? fit;
  final double? width,height;
  const PNetworkImage(this.image, {Key? key,this.fit,this.height,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    CachedNetworkImage(
      imageUrl: image!,
      fit: fit,
      width: width,
      height: height,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          SpinKitWave(
            size: 40,
            itemBuilder: (BuildContext context, int index) {


              return DecoratedBox(

                decoration: BoxDecoration(
                  color: Colors.white54,
                ),
              );
            },
          ) ,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}