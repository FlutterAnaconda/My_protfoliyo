import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MYDetailsappbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  VoidCallback? onpressed;
  MYDetailsappbar({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.white,
      leading: InkWell(
        onTap: onpressed!,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'images/Frame 36797.png',
            height: 5,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 45.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1);
}
