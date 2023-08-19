import 'package:flutter/Material.dart';

import '../../models/paymentmethod.dart';



// ignore: must_be_immutable
class Paymentmethodcard extends StatefulWidget {



  const Paymentmethodcard({
    Key? key,


  }) : super(key: key);
 static const List<PaymentMethodModel> paymethod = [
    PaymentMethodModel("images/m3.png", "Cash on Delivery",),
    PaymentMethodModel("images/m1.png", "Paypal",),
    PaymentMethodModel("images/m2.png", "MasterCard",),
  ];

  @override
  State<Paymentmethodcard> createState() => _PaymentmethodcardState();
}

class _PaymentmethodcardState extends State<Paymentmethodcard> {
  int selectedPaymentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 250,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child:  GestureDetector(
                onTap:  () {
                  setState(() {
                    selectedPaymentIndex = index; // Update the selected index
                  });
                },
                child: Stack(
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
                                child: Text(Paymentmethodcard.paymethod[index].text),
                              ),
                              const Spacer(),
                              SmoothCheckBox(
                                isSelected: selectedPaymentIndex == index,
                                index:index,
                                selectedindex:selectedPaymentIndex,
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
                            Paymentmethodcard.paymethod[index].imageurl,
                            scale: 3.5,
                            // fit: BoxFit.fill,
                          ), // Replace with your image
                        ),
                      ),
                    ),
                  ],
                ),
              )
              );

          },
        ));





  }
}

// ignore: must_be_immutable
class SmoothCheckBox extends StatefulWidget {
   final int selectedindex;
   final int index;
   bool? isSelected;

   SmoothCheckBox({super.key,  this.isSelected, required this.selectedindex, required this.index, });

  @override
  // ignore: library_private_types_in_public_api
  _SmoothCheckBoxState createState() => _SmoothCheckBoxState();
}

class _SmoothCheckBoxState extends State<SmoothCheckBox> {
   bool? ischecked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
           ischecked =   widget.selectedindex ==  widget.index;
           widget.isSelected=ischecked;
        });

      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: widget.isSelected!
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child:widget.isSelected!
            ? const Icon(Icons.check, color: Colors.white)
            : const SizedBox.shrink(),
      ),
    );
  }
}
