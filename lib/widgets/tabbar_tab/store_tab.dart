import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Providers/storeprovider.dart';
import '../../Screens/GroceryShop/Bottomtab/Storetab.dart';
import 'itemtab.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StorestState();
}

class _StorestState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {
              Provider.of<StoreProvider>(context, listen: false)
                  .selectStore(list[index]),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StoreTab(),
                ),
              ),
            },
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              list[index].image!,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 10),
                              child: Text(
                                list[index].title!,
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
                                  list[index].location!,
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
                                    list[index].rating!.toStringAsFixed(1),
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
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              list[index].isfav = !list[index].isfav;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              list[index].isfav
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
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
      ),
    );
  }
}
