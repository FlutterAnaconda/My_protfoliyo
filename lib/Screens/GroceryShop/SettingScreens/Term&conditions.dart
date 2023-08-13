import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../widgets/text/constants.dart';
import '../../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../../widgets/textfields/butons/outlinebutton.dart';

class TermconScreen extends StatefulWidget {
  const TermconScreen({
    super.key,
  });

  @override
  State<TermconScreen> createState() => _TermconScreenState();
}

class _TermconScreenState extends State<TermconScreen> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
      appBar: MYDetailsappbar(
        text: 'Term & Conditions',
        onpressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Use of Platform & Services',
                style: k16G600,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing\n elit. Etiam eu turpis molestie, dictum est a, mattis\ntellus. Sed dignissim, metus nec fringilla accumsan,\n risus sem sollicitudin lacus, ut interdum tellus elit sed \nrisus. Maecenas eget condimentum velit, sit amet feugiat lectus.\n Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. \nPraesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar.\n Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem.\n Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.',
                style: k14lightgery400style,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Personal Information that you provide',
                style: k16lightblack600style,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per. ',
                style: k14lightgery400style,
              ),
              Text(
                'Cancelation',
                style: k16lightblack600style,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus. ',
                style: k14lightgery400style,
              ),
              Row(
                children: [
                  Checkbox(
                    splashRadius: 20,
                    activeColor: Theme.of(context).primaryColor,
                    value: ischecked,
                    onChanged: (value) => setState(() {
                      ischecked = !ischecked;
                    }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'I agree with this',
                    style: k14Grey300style,
                  ),
                  Text(
                    ' Terms & Conditions',
                    style: k14darkGrey500style,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 161,
              child: GradientElevatedButton(
                onPressed: () {
                  if (ischecked == false) {
                    Fluttertoast.showToast(
                      msg: 'please accept Term&Condition',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                text: 'Accept',
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 161,
              child: Myoutlinebutton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Cancel',
              ),
            )
          ],
        ),
      ),
    );
  }
}
