import 'package:flutter/material.dart';

class SelectRating extends StatefulWidget {
  const SelectRating({super.key});

  @override
  State<SelectRating> createState() => _SelectRatingState();
}

class _SelectRatingState extends State<SelectRating> {
  Set<int> selectedCheckboxIndices = {};
  String image = 'images/star.png';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
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
                    SizedBox(
                      width: 130,
                      height: 30,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: index + 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset(
                              image,
                              height: 16,
                              width: 16,
                            ),
                          );
                        },
                      ),
                    )
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
