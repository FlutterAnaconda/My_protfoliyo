import 'package:flutter/Material.dart';

import '../../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../../widgets/textfields/textfield.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController holderNameController = TextEditingController();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();

    // Listen to text changes in the text controllers and update the card accordingly
    holderNameController.addListener(updateCard);
    cardNoController.addListener(updateCard);
    dateController.addListener(updateCard);
    cvvController.addListener(updateCard);
  }

  @override
  void dispose() {
    // Dispose the text controllers to avoid memory leaks
    holderNameController.dispose();
    cardNoController.dispose();
    dateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  // Function to update the card
  void updateCard() {
    setState(() {}); // Notify the widget to rebuild and update the card
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VisaCardWidget(
                    holderName: holderNameController.text,
                    cardNumber: cardNoController.text,
                    cvv: cvvController.text,
                    date: dateController.text,
                  ),
                ),
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    TextInputType keyboardType = TextInputType.text;

                    if (index == 1) {
                      keyboardType = TextInputType.number;
                    }

                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: MyTextFormField(
                        controller: index == 0
                            ? holderNameController
                            : cardNoController,
                        labelText: index == 0 ? 'Holder Name' : 'Card Number',
                        name: index == 0 ? 'Holder Name' : 'Card Number',
                        mykeyboardType: keyboardType,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    TextInputType keyboardType = TextInputType.datetime;

                    if (index == 1) {
                      keyboardType = TextInputType.number;
                    }
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: 172,
                        child: MyTextFormField(
                          controller:
                              index == 0 ? dateController : cvvController,
                          labelText: index == 0 ? 'dd/mm/yy' : 'Cvv',
                          name: index == 0 ? 'dd/mm/yy' : 'Cvv',
                          mykeyboardType: keyboardType,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // const Spacer(),
              GradientElevatedButton(
                text: 'Add Card',
                onPressed: () {
                  // Add your button's onPressed logic here
                  //TODO: change to pushreplacement
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VisaCardWidget extends StatelessWidget {
  final String holderName;
  final String cardNumber;
  final String date; // Add date field
  final String cvv; // Add cvv field

  const VisaCardWidget({
    Key? key,
    required this.holderName,
    required this.cardNumber,
    required this.date,
    required this.cvv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [ Colors.purple,Colors.lightBlueAccent,Colors.purple,], // Add the gradient colors
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment .spaceBetween,
              children: [

                const Text(
                  'Visa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Image.asset('images/chip.png',width: 31.67,height: 27.71,),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              (cardNumber.isEmpty) ? '**** **** ****' : cardNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Holder Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              (holderName.isEmpty) ? '--------------' : holderName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'dd/mm/yy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Cvv',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (date.isEmpty) ? '**/**/**' : date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  (cvv.isEmpty) ? '****' : cvv,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
