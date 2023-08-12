import 'package:flutter/Material.dart';

class SettingtabModel {
  final String title;
  final Function(BuildContext) onpressed;
  final String iconspath;
  const SettingtabModel(
      {required this.title, required this.onpressed, required this.iconspath});
}
