import 'package:flutter/material.dart';

class MyLoginWithButton extends StatelessWidget {
  final String iconUrl;
  final VoidCallback onTap;
  final String text;

  const MyLoginWithButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.iconUrl});
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return SizedBox(
        width: mediaquery.width * 0.7,
        height: 60,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Color(0xFFD6D8DA), width: 0.5),
            ),
            padding: const EdgeInsets.all(16.0),
            elevation: 4.0,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          child: SizedBox(
            width: mediaquery.width,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Add your prefix icon here
                SizedBox(
                    height: mediaquery.height * 0.1,
                    width: mediaquery.width * 0.1,
                    child: Image.asset(iconUrl)),
                const SizedBox(
                    width: 8.0), // Adjust the spacing between icon and text
                Text(
                  text,
                  // Replace this with your desired button text
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            ),
          ),
        ));
  }
}
