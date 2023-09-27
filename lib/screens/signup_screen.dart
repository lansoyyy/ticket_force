import 'package:flutter/material.dart';
import 'package:ticket_force/screens/login_screen.dart';
import 'package:ticket_force/utils/colors.dart';
import 'package:ticket_force/widgets/button_widget.dart';
import 'package:ticket_force/widgets/text_widget.dart';
import 'package:ticket_force/widgets/textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
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
                controller: nameController,
                label: 'Name',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                controller: numberController,
                label: 'Contact Number',
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
                height: 10,
              ),
              TextFieldWidget(
                isObscure: true,
                showEye: true,
                controller: confirmpasswordController,
                label: 'Confirm Password',
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonWidget(
                label: 'Signup',
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Already have an account?',
                    fontSize: 12,
                    fontFamily: 'Regular',
                    color: Colors.grey,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    child: TextWidget(
                      text: 'Login',
                      fontSize: 14,
                      fontFamily: 'Medium',
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
