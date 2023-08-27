import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/chooseimage.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:dotcoder1/widgets/textfields/textfield.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/dropdown/Mydropdown.dart';
import '../../../../widgets/textfields/Descriptiontextfeild.dart';
class Addproducttab extends StatefulWidget {
  const Addproducttab({super.key});

  @override
  State<Addproducttab> createState() => _AddproducttabState();
}

class _AddproducttabState extends State<Addproducttab> {


  static const List<String> list=[

    'Delivery Time',
    'item1',
    'item2',
    'item3',

  ];
  TextEditingController prodnamecontroller= TextEditingController();
  TextEditingController prodaddcontroller= TextEditingController();
  TextEditingController puritycontroller= TextEditingController();
  TextEditingController gmcontroller= TextEditingController();
  @override
  void dispose() {
    prodaddcontroller.dispose();
    prodnamecontroller.dispose();
    puritycontroller.dispose();
    gmcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MYDetailsappbar(text: 'Add Product',onpressed: () {

      },),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Add Images',style: k14B500style,),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: ImageContainer(width: 337, heigth: 143, text: 'Add Product', radius: 10),
            ),

            const Row(
               children: [
                 SizedBox(width: 10,),
                 ImageContainer(width: 105, heigth: 72, text: 'Add 1', radius: 10),
                 SizedBox(width: 10,),
                 ImageContainer(width: 105, heigth: 72, text: 'Add 2', radius: 10),
                 SizedBox(width: 10,),
                 ImageContainer(width: 105, heigth: 72, text: 'Add 3', radius: 10),
               ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 20,bottom: 20),
              child: Text('Add Information',style: k14B500style,),
            ),
            MyTextFormField(name: 'Product Name', labelText: 'Product Name', controller: prodnamecontroller),
            const SizedBox(height: 20,),
            MyTextFormField(name: 'Product Address', labelText: 'Product Address', controller: prodaddcontroller),
            const SizedBox(height: 20,),
            const DescriptionWidget(
              description:
              'Lorem ipsum dolor sit amet, Lorem ipsum\n dolor sit amet, consectetur \nadipiscing elit.consectetur adipiscing ',
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const MyDropDownFormField(hinttext: 'Delivery Time', list: list, iscolorchanged: true,),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                SizedBox( width: MediaQuery.of(context).size.width*0.5,child: MyTextFormField(name: 'Purity', labelText: 'Purity', controller: puritycontroller)),
                SizedBox( width: MediaQuery.of(context).size.width*0.5,child: MyTextFormField(name: 'Kcal/gm', labelText: 'Kcal/gm', controller: gmcontroller)),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 40),
              child: GradientElevatedButton(text: 'Add Product', onPressed: (){}),
            ),
          ],
        ),
      ),
    );
  }
}
