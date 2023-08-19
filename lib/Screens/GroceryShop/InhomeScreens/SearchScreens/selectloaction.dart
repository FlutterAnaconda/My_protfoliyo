import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class LocationSlider extends StatefulWidget {
  @override
  _LocationSliderState createState() => _LocationSliderState();
}

class _LocationSliderState extends State<LocationSlider> {
  double _currentMiles = 5.0; // Initial value in miles

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 140,
          width: MediaQuery.of(context).size.width*0.95,
          child: Stack(
            children: [
              SfSliderTheme(
                data: SfSliderThemeData(
                    tickSize: const Size(1, 5),
                    tickOffset: const Offset(2, 2),
                    activeTickColor: Theme.of(context).primaryColor,
                    tooltipBackgroundColor: Theme.of(context).primaryColor,
                    thumbColor: const Color(0xffD6D8DA),
                    tooltipTextStyle: GoogleFonts.poppins(
                      fontSize: 10.63,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,

                    )),
                child: SfSlider(
                  value: _currentMiles,
                  onChanged: (value) {
                    setState(() {
                      _currentMiles = value;
                    });
                  },

                  tooltipTextFormatterCallback: (actualValue, formattedText) {
                    return '${actualValue.round()} Miles';
                  },
                  min: 0,
                  max: 50,
                  interval: 10,
                  showLabels: true,
                  inactiveColor: const Color(0xffD6D8DA),
                  activeColor: const Color(0xff07CD6E),
                  minorTicksPerInterval: 0,
                  showTicks: true,

                  labelFormatterCallback: (actualValue, formattedText) {
                    if (actualValue == 50) {
                      return '${actualValue.round()} Miles';
                    }
                    return '${actualValue.round()}';
                  },
                ),
              ),
              Positioned(
                left: _currentMiles / 2 * 10,
                top: 20, // Adjust as needed
                child: CustomRectangularTooltip(
                  text: '${_currentMiles.round()} miles',
                ),
              ),
            ],
          ),
        ),

        // SizedBox(height: 16),
        // Text(
        //   'Selected Location: $_currentMiles miles',
        //   style: TextStyle(fontSize: 16),
        // ),
      ],
    );
  }
}

//
// import 'package:flutter/Material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'package:syncfusion_flutter_core/theme.dart';
//
//
// class MySliderWithTooltip extends StatefulWidget {
//   const MySliderWithTooltip({super.key});
//
//   @override
//   _MySliderWithTooltipState createState() => _MySliderWithTooltipState();
// }
//
// class _MySliderWithTooltipState extends State<MySliderWithTooltip> {
//   double _currentMiles = 0;
//   GlobalKey _sliderKey = GlobalKey();
//   double _tooltipXPosition = 0;
//   bool _isTooltipVisible = false;
//
//   void _showTooltip(dynamic details) {
//     final RenderBox renderBox = _sliderKey.currentContext!.findRenderObject() as RenderBox;
//     final double width = renderBox.size.width;
//     final double position = details.localPosition.dx;
//     final double value = (position / width) * 50; // Assuming min: 0, max: 50
//
//     setState(() {
//       _currentMiles = value;
//       _tooltipXPosition = position;
//       _isTooltipVisible = true;
//     });
//   }
//
//   void _hideTooltip() {
//     setState(() {
//       _isTooltipVisible = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           key: _sliderKey,
//           onHorizontalDragUpdate: _showTooltip,
//           onHorizontalDragEnd: (_) => _hideTooltip(),
//           child: Stack(
//             children: [
//               SfSliderTheme(
//                 data: SfSliderThemeData(
//                   // ... other theme settings
//                 ),
//                 child: SizedBox(
//                   height: 140,
//                   child: SfSlider(
//                     enableTooltip: false, // We'll handle the tooltip separately
//                     value: _currentMiles,
//                     onChanged: (value) {
//                       setState(() {
//                         _currentMiles = value;
//                       });
//                     },
//     tooltipTextFormatterCallback: (actualValue, formattedText) {
//               return '${actualValue.round()} Miles';
//             },
//             min: 0,
//             max: 50,
//             interval: 10,
//             showLabels: true,
//             inactiveColor: const Color(0xffD6D8DA),
//             activeColor: const Color(0xff07CD6E),
//             minorTicksPerInterval: 0,
//             showTicks: true,
//
//             labelFormatterCallback: (actualValue, formattedText) {
//               if (actualValue == 50) {
//                   return '${actualValue.round()} Miles';
//               }
//               return '${actualValue.round()}';
//
//             },
//                     // ... other slider properties
//                   ),
//                 ),
//               ),
//               if (_isTooltipVisible)
//                 Positioned(
//                   left:_currentMiles / 2 * 10,
//                   top: 20, // Adjust as needed
//                   child: CustomRectangularTooltip(
//                     text: '${_currentMiles.round()} miles',
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
class CustomRectangularTooltip extends StatelessWidget {
  final String text;

  CustomRectangularTooltip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(0)),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 10.63,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
