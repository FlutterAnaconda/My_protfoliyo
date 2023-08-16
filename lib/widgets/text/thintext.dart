import 'package:flutter/material.dart';

import 'constants.dart';

class Thintext extends StatelessWidget {
  final String text;
  const Thintext({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: k14Grey500style,
    );
  }
}
