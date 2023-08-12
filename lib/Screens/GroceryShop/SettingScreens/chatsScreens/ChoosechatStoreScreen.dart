import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/textfields/searchtextfeild.dart';
import '../../InhomeScreens/allstoresscreen.dart';
import 'chat.dart';

class ChoosechatStoreScreen extends StatefulWidget {
  const ChoosechatStoreScreen({super.key});

  @override
  State<ChoosechatStoreScreen> createState() => _ChoosechatStoreScreenState();
}

class _ChoosechatStoreScreenState extends State<ChoosechatStoreScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MYDetailsappbar(
          text: 'Chat',
          onpressed: () => Navigator.pop(context),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SearchTextField(
              controller: controller,
              suggestions: const [],
            ),
            const SizedBox(
              height: 20,
            ),
            // const SizedBox(height: 500, child: AllStoresscreen()),
            SizedBox(height: 500, child: chooseStores()),
          ],
        ),
      ),
    );
  }

  Widget chooseStores() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConversationScreen(),
              )),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the container background color
              borderRadius: BorderRadius.circular(5),
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
            margin: const EdgeInsets.all(8),
            child: SizedBox(
              width: 252, // Replace with your desired fixed width
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'images/Group 1171276027.png',
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0, left: 10),
                            child: Text(
                              'Home mart',
                              style: GoogleFonts.poppins(
                                fontSize: 12.8,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(0xff737373),
                              ),
                              Text(
                                'al-barg pindi',
                                style: GoogleFonts.poppins(
                                    color: Colors.black45, fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '5.0',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, Lorem \nipsum dolor sit amet, consectetur ',
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
