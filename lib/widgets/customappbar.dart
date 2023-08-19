import 'package:dotcoder1/widgets/text/constants.dart';
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// ignore: must_be_immutable
class Mytypingappbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final VoidCallback? onpressed;
  final String imagepath;

  const Mytypingappbar({
    super.key,
    required this.text,
    this.onpressed,
    required this.imagepath,
  });

  final bool isonline = true;
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
      title: Column(
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Active Now',
                style: k12darkgrey400,
              ),
              const SizedBox(
                width: 6,
              ),
              isonline
                  ? Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff19D715),
                      ),
                    )
                  : Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromARGB(255, 206, 209, 206),
                      ),
                    )
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(imagepath),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
