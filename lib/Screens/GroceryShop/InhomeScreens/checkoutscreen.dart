import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/paymentmethod.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/checkoutmodel.dart';

import '../../../widgets/Stepper/Stepper.dart';

import '../../../widgets/dropdown/Mydropdown.dart';


import '../../../widgets/textfields/textfield.dart';

class CheckOutScreen extends StatefulWidget {
  final double total;
  const CheckOutScreen({super.key, required this.total});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int? _currentPage;

  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  final PageController _contentPageController = PageController(initialPage: 0);
  // int? selectedCardIndex;

  List<CheckoutModel> deliverywidgetform = [
    CheckoutModel("Full Name", TextEditingController()),
    CheckoutModel("Phone Number", TextEditingController()),
    CheckoutModel("Address", TextEditingController()),
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _contentPageController.addListener(() {
      setState(() {
        _currentPage = _contentPageController.page!.toInt();
        // print("Currrnet page $_currentPage");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Mystepper(currentindex: _currentPage),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                controller: _contentPageController,
                scrollDirection: Axis.horizontal,
                // physics: const NeverScrollableScrollPhysics(),
                children: [
                  addresswidget(() {
                    _contentPageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                  }),
                  const PaymentScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool issave = false;
  Widget addresswidget(Function ontap) => SingleChildScrollView(
        child: Column(
          children: [
            const MyDropDownFormField(),
            SizedBox(
              height: 215,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: deliverywidgetform.length,
                  itemBuilder: (context, index) {
                    TextInputType keyboardType =
                        TextInputType.text; // Default keyboard type

                    // Check if the current field is a phone number field
                    if (deliverywidgetform[index].label == 'Phone Number') {
                      keyboardType = TextInputType.phone;
                    }
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: MyTextFormField(
                        controller: deliverywidgetform[index].controller,
                        labelText: deliverywidgetform[index].label,
                        name: deliverywidgetform[index].label,
                        mykeyboardType: keyboardType,
                      ),
                    );
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: MyTextFormField(
                    controller: zipCodeController,
                    labelText: 'Zipcode',
                    name: 'Zipcode',
                  ),
                ),
                Expanded(
                  child: MyTextFormField(
                    controller: cityController,
                    labelText: 'City',
                    name: 'City',
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
              child: Row(
                children: [
                  // GestureDetector(
                  //   onTap: () => setState(() {
                  //     issave = !issave;
                  //   }),
                  //   child: issave
                  //       ? Icon(
                  //           Icons.square_sharp,
                  //           color: Colors.grey.withOpacity(0.50),
                  //           size: 30,
                  //           // fill: 1,
                  //         )
                  //       : const Icon(
                  //           Icons.square_sharp,
                  //           color: Colors.green,
                  //           size: 30,
                  //           // fill: 1,
                  //         ),
                  // ),
                  Checkbox(
                      value: issave,
                      activeColor: Colors.green,
                      onChanged: ((value) => setState(() {
                            issave = !issave;
                          }))),
                  Text("Save shipping address",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: Card(
                surfaceTintColor: Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              "Total",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: Colors.black45),
                            ),
                            const Spacer(),
                            Text('\$${widget.total.toStringAsFixed(2)}',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.black45)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" Delivery free for 3.6km",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                            const Spacer(),
                            Text("data",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Center(
                              child: GradientElevatedButton(onPressed:  () {
                            _contentPageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear);
                          }, text: 'Next')),
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
      );
}
