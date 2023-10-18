import 'package:flutter/material.dart';
import 'package:ticket_force/screens/home_screen.dart';
import 'package:ticket_force/utils/colors.dart';
import 'package:ticket_force/widgets/button_widget.dart';
import 'package:ticket_force/widgets/textfield_widget.dart';

class RegisterDriverTab extends StatefulWidget {
  const RegisterDriverTab({super.key});

  @override
  State<RegisterDriverTab> createState() => _RegisterDriverTabState();
}

class _RegisterDriverTabState extends State<RegisterDriverTab> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final contactnumberController = TextEditingController();
  final addressController = TextEditingController();
  final licensednumberController = TextEditingController();
  final vehicletypeController = TextEditingController();
  final platenumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Gray.png'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logs.png',
                        width: 150,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: firstnameController,
                    label: 'First Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    controller: lastnameController,
                    label: 'Last Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    controller: contactnumberController,
                    label: 'Contact Number',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    controller: addressController,
                    label: 'Address',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    controller: licensednumberController,
                    label: 'Licensed Number',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    controller: vehicletypeController,
                    label: 'Vehicle Type',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    controller: platenumberController,
                    label: 'Plate Number',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    color: primary,
                    radius: 20,
                    textColor: Colors.black,
                    label: 'REGISTER DRIVER',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                  ),
                  const SizedBox(
                    height: 20,
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
