import 'package:flutter/material.dart';
import 'package:ticket_force/screens/login_screen.dart';
import 'package:ticket_force/screens/signup_screen.dart';
import 'package:ticket_force/utils/colors.dart';
import 'package:ticket_force/widgets/button_widget.dart';
import 'package:ticket_force/widgets/text_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Traffic.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
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
              Container(
                width: double.infinity,
                color: Colors.white.withOpacity(0.4),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextWidget(
                      text:
                          'Unlocking Unforgettable Experiences,\nOne Ticket at a Time!',
                      fontSize: 14,
                      fontFamily: 'Bold',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              ButtonWidget(
                width: 200,
                color: primary,
                textColor: Colors.black,
                radius: 20,
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
                color: Colors.white,
                fontFamily: 'Medium',
              ),
              const SizedBox(
                height: 5,
              ),
              ButtonWidget(
                width: 200,
                color: Colors.white.withOpacity(0.7),
                textColor: Colors.black,
                radius: 20,
                label: 'Sign up',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignupScreen()));
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
