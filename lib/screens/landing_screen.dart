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
                height: 450,
              ),
              Container(
                width: double.infinity,
                color: Colors.white.withOpacity(0.4),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextWidget(
                      text: 'Welcome to TicketForce',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                minWidth: 200,
                height: 50,
                color: primary.withOpacity(0.60),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                child: const Icon(
                  Icons.keyboard_double_arrow_right_rounded,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
