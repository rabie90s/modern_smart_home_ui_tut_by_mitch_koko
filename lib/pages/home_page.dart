import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_smart_home_ui_tut_by_mitch_koko/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Padding constats:
  final double horizontalPadding = 40;
  final double verticalPadding = 25;
  // List of smart devices:
  List mySmartDevices = [
    // [smartDeviceName, iconPath, powerStatus]
    ['Smart Light', 'lib/icons/light-bulb.png', true],
    ['Smart AC', 'lib/icons/air-conditioner.png', false],
    ['Smart TV', 'lib/icons/smart-tv.png', false],
    ['Smart Fan', 'lib/icons/fan.png', false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // costem App bar:
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'lib/icons/menu.png',
                  height: 45,
                  color: Colors.grey[800],
                ),

                // Account icon:
                Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          // Welcome Home Dev Rabie ^_^
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome Home,'),
                Text(
                  'Dev Rabie ',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 72,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          // Smart devices + grid:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              'Smart devices ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.grey[800],
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mySmartDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      smartDeviceName: mySmartDevices[index][0],
                      iconPath: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    );
                  }))
        ]),
      ),
    );
  }
}
