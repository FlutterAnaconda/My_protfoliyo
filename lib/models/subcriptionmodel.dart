import 'package:flutter/Material.dart';

class SubscribeModel{
  final String imagepath;
  final String packagename;
  final String packageprice;
  final String validdays;
  final String maxorder;
  final String maxproduct;
  final Color color;
  SubscribeModel(
      this.imagepath,
      this.packagename,
      this.packageprice,
      this.validdays,
      this.maxorder,
      this.maxproduct,
      int colorValue,
      ) : color = Color(colorValue);
}
