import 'package:flutter/Material.dart';

// class Paymentmethodcard extends StatelessWidget {
//   final String imageUrl;
//   final String text;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const Paymentmethodcard({
//     super.key,
//     required this.imageUrl,
//     required this.text,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
//       child: ListTile(
//         // contentPadding: EdgeInsets.symmetric(vertical: 2),
//         tileColor: Colors.white70,
//         leading: ClipOval(
//           child: Image.asset(
//             imageUrl,
//             width: 40,
//             height: 40,
//             // fit: BoxFit.fill,
//           ),
//         ),
//         title: Text(
//           text,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
// trailing: AnimatedContainer(
//   duration: const Duration(milliseconds: 200),
//   width: 30,
//   height: 30,
//   decoration: BoxDecoration(
//     color: isSelected
//         ? Theme.of(context).primaryColor
//         : Colors.transparent,
//     border: Border.all(color: Theme.of(context).primaryColor),
//     borderRadius: BorderRadius.circular(4),
//   ),
//   child: isSelected
//       ? const Icon(Icons.check, color: Colors.white)
//       : const SizedBox.shrink(),
// ),
// onTap: onTap,
// subtitle: const SizedBox
//     .shrink(), // Call the callback function when the card is tapped
// ),
//     );
//   }
// }

// ignore: must_be_immutable
class Paymentmethodcard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const Paymentmethodcard({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // Set the container background color
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 0.5,
                    color: Colors.black
                        .withOpacity(0.05)), // Optional: Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 0, // Spread radius (controls the blur)
                    blurRadius: 2.84415602684021, // Blur radius
                    offset: const Offset(0, 2), // Offset in the x and y axes
                  ),
                ],
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(text),
                  ),
                  const Spacer(),
                  SmoothCheckBox(
                    isSelected1: isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Material(
            elevation: 1,
            shape: const CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Image.asset(
                imageUrl,
                scale: 3.5,
                // fit: BoxFit.fill,
              ), // Replace with your image
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class SmoothCheckBox extends StatefulWidget {
  bool isSelected1;

  SmoothCheckBox({super.key, required this.isSelected1});

  @override
  // ignore: library_private_types_in_public_api
  _SmoothCheckBoxState createState() => _SmoothCheckBoxState();
}

class _SmoothCheckBoxState extends State<SmoothCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected1 = !widget.isSelected1;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: widget.isSelected1
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: widget.isSelected1
            ? const Icon(Icons.check, color: Colors.white)
            : const SizedBox.shrink(),
      ),
    );
  }
}
