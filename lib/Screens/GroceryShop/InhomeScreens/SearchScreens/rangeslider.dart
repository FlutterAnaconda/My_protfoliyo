import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({
    Key? key,
  }) : super(key: key);

  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(0, 50);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Stack(
            children: [
              RangeSlider(
                values: _currentRangeValues,
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
                min: 0,
                max: 300,
                inactiveColor: const Color(0xFFD9D9D9),
                activeColor: const Color(0xff07CD6E),
                divisions: 300,

                // labels: RangeLabels(
                //   '\$${_currentRangeValues.start.toStringAsFixed(1)}',
                //   '\$${_currentRangeValues.end.toStringAsFixed(0)}',
                // ),
              ),
              Positioned(
                left: _currentRangeValues.start / 300 * 300,
                top: 32,
                child: Text(
                  '\$${_currentRangeValues.start.toStringAsFixed(0)}',
                  style: GoogleFonts.poppins(
                    fontSize: 10.62,
                    color: const Color(0xff898686),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: _currentRangeValues.end / 300 * 300,
                top: 32,
                child: Text(
                  '\$${_currentRangeValues.end.toStringAsFixed(0)}',
                  style: GoogleFonts.poppins(
                    fontSize: 10.62,
                    color: const Color(0xff898686),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
