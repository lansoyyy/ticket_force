import 'package:flutter/material.dart';
import 'package:ticket_force/screens/home_screen.dart';
import 'package:ticket_force/utils/colors.dart';
import 'package:ticket_force/widgets/button_widget.dart';
import 'package:ticket_force/widgets/text_widget.dart';
import 'package:ticket_force/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Gray.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Container(
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
                  TextFieldWidget(
                    controller: emailController,
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    isObscure: true,
                    showEye: true,
                    controller: passwordController,
                    label: 'Password',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    textColor: Colors.black,
                    color: primary,
                    radius: 20,
                    label: 'Log in',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
