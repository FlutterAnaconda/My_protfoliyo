import 'dart:async';

import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../widgets/Stepper/Stepper.dart';

class Trackorder extends StatefulWidget {
  const Trackorder({Key? key}) : super(key: key);

  @override
  State<Trackorder> createState() => _TrackorderState();
}

class _TrackorderState extends State<Trackorder> {
  final Completer<GoogleMapController> _controller = Completer();

  // GoogleMapController newGoogleMapController  ;
  final CameraPosition kSoftwareHouse = const CameraPosition(
    target: LatLng(33.575275, 71.457099),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MYDetailsappbar(
          text: 'Map',
          onpressed: () {
            Navigator.pop(context);
          }),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: kSoftwareHouse,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              // _controller=controller as Completer<GoogleMapController>;
            },
          ),
          Container(
            height: 190,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 15),
                  child: Text(
                    'On The Way',
                    style: k18B700style,
                  ),
                ),
                Mystepper(
                    currentindex: 0,
                    firsttext: 'Order Placed',
                    secondtext: 'On the way',
                    thridtext: 'Delivered', isdummyneeded: true,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                  ),
                  child: Divider(
                    color: const Color(0xff000000).withOpacity(0.05),
                  ),
                ),
                Row(

                  children: [
                    const SizedBox(width: 10,),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://th.bing.com/th/id/OIP.HVoahcVZ6UJSTse0w1fItAHaLH?pid=ImgDet&rs=1'),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Your Delivery",
                          style: k12Grey400style,
                        ),
                        Text(
                          "Jhon Nerov",
                          style: k16B600style,
                        ),
                      ],
                    ),
                    const SizedBox(width: 90,),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Color(0xffF3F5F7),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'images/message.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Color(0xffF3F5F7),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('images/call1.png',width: 20,
                          height: 20,
                          fit: BoxFit.fill,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
