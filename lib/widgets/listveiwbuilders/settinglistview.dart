import 'package:flutter/Material.dart';

import '../text/constants.dart';

class ContainerListItem extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final String iconspath;
  const ContainerListItem(
      {super.key,
      required this.title,
      required this.onpressed,
      required this.iconspath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onpressed,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.asset(
                iconspath, // Replace with your image asset path
                width: 22.0,
                height: 22.0,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  title,
                  style: k14darkbrown500style,
                ),
              ),
              const SizedBox(width: 16.0),
              Image.asset(
                'images/settingicons/arrow.png', // Replace with your image asset path
                width: 20.0,
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
