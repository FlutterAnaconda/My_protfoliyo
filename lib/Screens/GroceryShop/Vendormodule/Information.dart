import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/chooseimage.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/searchtextfeild.dart';
import 'package:flutter/material.dart';

import '../../../widgets/dropdown/Mydropdown.dart';
import '../../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../../widgets/textfields/textfield.dart';

class InformationScreen extends StatefulWidget {
  final VoidCallback onslide;
  const InformationScreen({super.key, required this.onslide, });

  static const List<String> list = [
    'Select Module',
    'Item 2',
    'Item 3',
    'Item 4',
  ];
  static const List<String> listtime = [
    'Select Time Type',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  bool showpass = true;
  bool showpass1 = true;
  TextEditingController storenamecontroller = TextEditingController();

  TextEditingController storeaddresscontroller = TextEditingController();

  TextEditingController taxcontroller = TextEditingController();
  TextEditingController mincontroller = TextEditingController();
  TextEditingController maxcontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();
  TextEditingController laticontroller = TextEditingController();
  TextEditingController longicontroller = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    storenamecontroller.dispose();
    storeaddresscontroller.dispose();
    taxcontroller.dispose();
    mincontroller.dispose();
    maxcontroller.dispose();
    searchcontroller.dispose();
    laticontroller.dispose();
    longicontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: Text(
              "Store Information",
              style: k14B600style,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: ImageContainer(
                    width: 113, heigth: 123, text: 'Add Logo', radius: 20),
              ),
              Padding(
                padding: EdgeInsets.only(right: 6.0,left: 12),
                child: ImageContainer(
                    width: 210, heigth: 123, text: 'Add Cover', radius: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0,right: 15),
            child: MyDropDownFormField(
                hinttext: 'Select Module', list: InformationScreen.list, iscolorchanged: true,),
          ),
          const SizedBox(
            height: 18,
          ),
          MyTextFormField(
            controller: storenamecontroller,
            labelText: 'Store Name',
            name: 'Store Name',
          ),
      const SizedBox(
        height: 20,
      ),
          MyTextFormField(
            controller: storeaddresscontroller,
            labelText: 'Store Address',
            name: 'Store Address',
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            controller: taxcontroller,
            labelText: 'Vat/tax(\$)',
            name: 'Vat/tax',
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0,right: 15),
            child: MyDropDownFormField(
                hinttext: 'Select Time Type', list: InformationScreen.listtime, iscolorchanged: true,),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 355,
            child: Row(
              children: [
                SizedBox(
                    width: 175,
                    child: MyTextFormField(
                      controller: mincontroller,
                      labelText: 'Min Time',
                      name: 'Min Time',
                    )),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 175,
                  child: MyTextFormField(
                    controller: maxcontroller,
                    labelText: 'Max Time',
                    name: 'Max Time',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: Text('Set Store Location', style: k14B600style),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SearchTextField(
                controller: searchcontroller,
                suggestions: [],
                isexpanded: true,
                hinttext: 'Type Location', iscolorchanged: true,),
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(

            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Image.asset(
                  'images/map.png',
                  width: 342,
                  height: 184,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                    colors: [
                      const Color(0xff07CD6E),
                      const Color(0xff059F55).withOpacity(0.86),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  alignment: Alignment.center,
                  width: 40,
                  height: 37,
                  child: Image.asset(
                    'images/Currentloc.png',
                    width: 22,
                    height: 22,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
             width: 355,
            child: Row(
              children: [
                SizedBox(
                  width: 175,
                  child: MyTextFormField(
                    controller: laticontroller,
                    labelText: 'Latitude',
                    name: 'Latitude',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 175,
                  child: MyTextFormField(
                    controller: longicontroller,
                    labelText: 'Longitude',
                    name: 'Longitude',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: Text('Owner Information', style: k14B600style),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            name: 'name', // Assign a name to the form field
            labelText: 'Name',
            controller: _nameController,
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            name: 'email', // Assign a name to the form field
            labelText: 'Email',
            controller: _emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            obscure: showpass,
            name: 'Password',
            // Assign a name to the form field
            labelText: 'Password',
            controller: _passwordController,
            suffixicon: InkWell(
                onTap: () {
                  showpass = !showpass;
                  setState(() {});
                },
                child: showpass
                    ? Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: Image.asset(
                          width:
                              20, // Adjust the image width within the container
                          height: 20,
                          'images/eye.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Icon(
                        Icons.visibility,
                        color: Colors.blue,
                        size: 20,
                      )),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextFormField(
            obscure: showpass1,
            name: 'ConfirmPassword',
            // Assign a name to the form field
            labelText: 'ConfirmPassword',
            controller: _confirmPasswordController,
            suffixicon: InkWell(
                onTap: () {
                  showpass1 = !showpass1;
                  setState(() {});
                },
                child: showpass1
                    ? Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        child: Image.asset(
                          width:
                              20, // Adjust the image width within the container
                          height: 20,
                          'images/eye.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Icon(
                        Icons.visibility,
                        color: Colors.blue,
                        size: 20,
                      )),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: GradientElevatedButton(
              text: 'Next',
              onPressed:
                widget.onslide
                // Perform form submission

            ),
          ),
        ],
      ),
    );
  }
}
