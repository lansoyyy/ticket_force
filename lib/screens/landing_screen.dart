import 'package:flutter/material.dart';
import 'package:ticket_force/screens/login_screen.dart';
import 'package:ticket_force/utils/colors.dart';
import 'package:ticket_force/widgets/button_widget.dart';
import 'package:ticket_force/widgets/text_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/logs.png',
              width: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text:
                  'Unlocking Unforgettable Experiences,\nOne Ticket at a Time!',
              fontSize: 14,
              fontFamily: 'Medium',
            ),
            const Expanded(child: SizedBox()),
            ButtonWidget(
              label: 'Log in',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
            ),
            const SizedBox(
              height: 5,
            ),
            TextWidget(
              text: 'or',
              fontSize: 14,
              fontFamily: 'Medium',
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {},
              child: TextWidget(
                text: 'Sign up',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
