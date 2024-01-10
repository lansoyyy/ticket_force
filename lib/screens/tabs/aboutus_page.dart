import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/drawer_widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: primary,
        title: Image.asset(
          'assets/images/logs.png',
          height: 50,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/About Us.png',
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
