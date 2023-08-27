import 'package:dotcoder1/Providers/usertype.dart';
// import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../models/paymentmethod.dart';

import '../../../widgets/text/constants.dart';
import '../../../widgets/textfields/butons/outline_to_fill_button.dart';

class SubcribepackageScreen extends StatefulWidget {
  final String imagepath;
  final String packagename;
  final String packageprice;
  final String validdays;
  final String maxorder;
  final String maxproduct;
  final Color color;

  const SubcribepackageScreen({super.key,
    required this.imagepath,
    required this.packagename,
    required this.packageprice,
    required this.validdays,
    required this.maxorder,
    required this.maxproduct, required this.color,
  });

  @override
  State<SubcribepackageScreen> createState() => _SubcribepackageScreenState();
}

class _SubcribepackageScreenState extends State<SubcribepackageScreen> {
  static const List<PaymentMethodModel> detailslist = [
    PaymentMethodModel('images/vendor/maxorder.png', 'Max order'),
    PaymentMethodModel('images/vendor/maxprod.png', 'Max Product'),
    PaymentMethodModel('images/vendor/scale.png', 'Point of Scale'),
    PaymentMethodModel('images/vendor/mobile.png', 'Mobile App Access'),
    PaymentMethodModel('images/vendor/reviews.png', 'Review'),
  ];
  bool isTapped=false;
  void _onButtonTap() {
    setState(() {
      isTapped = !isTapped;
    });
  }
  @override
  Widget build(BuildContext context) {
    final package= Provider.of<Usertype>(context);
    bool selectedpackage;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(

          width: 342,
          decoration: cardcontainerdecoration,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(widget.imagepath,width: 244,height: 258,),
              const SizedBox(
                height: 10,
              ),
              Text(widget.packagename,style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: widget.color,
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.packageprice,style: k20B600style,),
                  Text(
                    ' (${widget.validdays} days )',style: k12Grey400style,),
                ],
              ),
              Container(
                  height: 310,
                  width: 342,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: detailslist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Image.asset(
                                  detailslist[index].imageurl,
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      detailslist[index].text == 'Max order'
                                          ? '${detailslist[index].text} (${widget.maxorder})'
                                          : detailslist[index].text ==
                                                  'Max Product'
                                              ? '${detailslist[index].text} (${widget.maxproduct})'
                                              : detailslist[index].text,
                                      style: k12Grey400style,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 1,
                                      width: 240,
                                      color: const Color(0xffEBEBF0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )),
               Mysubscribebutton(ontap: () { _onButtonTap();
               setState(() {
                 selectedpackage=true;
                 package.subscription(selectedpackage);
               });

                 }, isTapped:isTapped ,)
               // Padding(
               //   padding: const EdgeInsets.symmetric(horizontal: 80.0),
               //   child: GradientElevatedButton(text: 'Subscribe', onPressed: () {
               //     setState(() {
               //       selectedpackage=true;
               //       package.subscription(selectedpackage);
               //     });
               //
               //   },height: 35),
               // )
            ],
          )),
    );
  }
}
