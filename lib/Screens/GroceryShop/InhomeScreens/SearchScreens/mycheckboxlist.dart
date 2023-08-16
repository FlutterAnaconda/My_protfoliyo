import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCheckboxList extends StatefulWidget {
  const MyCheckboxList({Key? key}) : super(key: key);

  @override
  _MyCheckboxListState createState() => _MyCheckboxListState();
}

class _MyCheckboxListState extends State<MyCheckboxList> {
  Set<int> selectedCheckboxIndices = {};

  List<String> list = [
    'All',
    'Fruits (125)',
    'Vegetables (150)',
    'Dairy (75)',
    'Meat (42)',
    'Other (4)',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedCheckboxIndices.contains(index);

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedCheckboxIndices.remove(index);
                  } else {
                    selectedCheckboxIndices.add(index);
                  }
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF07CD6E)
                              : Colors.grey,
                        ),
                        gradient: isSelected
                            ? LinearGradient(
                                colors: [
                                  const Color(0xff07CD6E),
                                  const Color(0xFF059F55).withOpacity(0.86),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )
                            : null,
                      ),
                      child: Center(
                        child: isSelected
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      list[index],
                      style: GoogleFonts.poppins(
                        color: isSelected ? Colors.green : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
