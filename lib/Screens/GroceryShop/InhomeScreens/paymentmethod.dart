import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/paymentmethod.dart';
import '../../../widgets/cards/paymentmethodcard.dart';
import '../../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../../widgets/textfields/butons/addcardbutton.dart';

// ignore: must_be_immutable
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<PaymentMethodModel> paymethod = [
    PaymentMethodModel("images/m3.png", "Cash on Delivery"),
    PaymentMethodModel("images/m1.png", "Paypal"),
    PaymentMethodModel("images/m2.png", "MasterCard"),
  ];
  List<String> imagepath = [
    'images/card2.png',
    'images/card1.png',
  ];
  int? selectedCardIndex;
  @override
  Widget build(BuildContext context) {
    return paymentwidget();
  }

  Widget paymentwidget() => Stack(
        children: [
          SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Cards",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 178,
                child: ListView.builder(
                  itemCount: imagepath.length,
                  scrollDirection: Axis.horizontal,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Image.asset(imagepath[index])),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: DottedBorderButton(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 12.0),
                child: Text(
                  "Payment Methods",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Paymentmethodcard(
                          imageUrl: paymethod[index].Imageurl,
                          text: paymethod[index].text,
                          isSelected: selectedCardIndex ==
                              index, // Pass the selected state
                          onTap: () {
                            setState(() {
                              selectedCardIndex =
                                  index; // Update the selected card index
                            });
                          }),
                    );
                  },
                ),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
                child: GradientElevatedButton(
                  onPressed: () {},
                  text: 'Make Payment',
                ),
              ),
            ),
          ),
        ],
      );
}
