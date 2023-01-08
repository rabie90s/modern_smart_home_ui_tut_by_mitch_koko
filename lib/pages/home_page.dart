import 'package:flutter/material.dart';

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
              children: const [
                Text('Welcome Home, '),
                Text(
                  'Dev Rabie ',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // Smart devices + grid:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Text('Smart devices '),
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(color: Colors.lightGreenAccent),
                    );
                  }))
        ]),
      ),
    );
  }
}
