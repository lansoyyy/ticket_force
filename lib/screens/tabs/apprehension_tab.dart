import 'package:flutter/material.dart';
import 'package:ticket_force/screens/tabs/register_driver_tab.dart';
import 'package:ticket_force/utils/colors.dart';
import 'package:ticket_force/widgets/button_widget.dart';
import 'package:ticket_force/widgets/text_widget.dart';

class ApprehensionTab extends StatefulWidget {
  const ApprehensionTab({super.key});

  @override
  State<ApprehensionTab> createState() => _ApprehensionTabState();
}

class _ApprehensionTabState extends State<ApprehensionTab> {
  int index = 0;
  final searchController = TextEditingController();
  String nameSearched = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/profile.png',
                          height: 100,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'Spencer So',
                          fontSize: 24,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: '2020300527',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: '45 TICKETS',
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                        TextWidget(
                          text: 'TICKETFORCE',
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          index == 0
              ? first()
              : index == 1
                  ? second()
                  : third()
        ],
      ),
    );
  }

  Widget first() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextWidget(
                          text: 'Driver Selected',
                          fontSize: 18,
                          fontFamily: 'Bold',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.person,
                                size: 75,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: 'Spencer So',
                                    fontSize: 18,
                                    fontFamily: 'Bold',
                                  ),
                                  TextWidget(
                                    text: '[Information]',
                                    fontSize: 14,
                                    fontFamily: 'Medium',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Violations',
                        fontSize: 14,
                        fontFamily: 'Medium',
                      ),
                      const Icon(
                        Icons.menu,
                      ),
                    ],
                  ),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(
                    textColor: Colors.black,
                    radius: 20,
                    width: 150,
                    color: Colors.red,
                    label: 'Cancel',
                    onPressed: () {},
                  ),
                  ButtonWidget(
                    textColor: Colors.black,
                    radius: 20,
                    width: 150,
                    color: primary,
                    label: 'Done',
                    onPressed: () {
                      setState(() {
                        index++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget second() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                  text: 'Total Amount',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 10; i++)
                          SizedBox(
                            width: 160,
                            child: ListTile(
                              leading:
                                  const Icon(Icons.check_box_outline_blank),
                              title: TextWidget(
                                text: 'Violation $i',
                                fontSize: 14,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 10; i++)
                          SizedBox(
                            width: 160,
                            child: ListTile(
                              leading:
                                  const Icon(Icons.check_box_outline_blank),
                              title: TextWidget(
                                text: 'Violation $i',
                                fontSize: 14,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget(
                      textColor: Colors.black,
                      radius: 20,
                      width: 150,
                      color: Colors.red,
                      label: 'Cancel',
                      onPressed: () {
                        setState(() {
                          index--;
                        });
                      },
                    ),
                    ButtonWidget(
                      textColor: Colors.black,
                      radius: 20,
                      width: 150,
                      color: primary,
                      label: 'Done',
                      onPressed: () {
                        setState(() {
                          index++;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget third() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextWidget(
                    text: '[Ticket Number]',
                    fontSize: 14,
                    fontFamily: 'Bold',
                    color: Colors.red,
                  ),
                ),
                TextWidget(
                  text: 'Spencer So',
                  fontSize: 24,
                  fontFamily: 'Bold',
                  color: Colors.black,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextWidget(
                    text: '[Information]',
                    fontSize: 14,
                    fontFamily: 'Bold',
                    color: Colors.red,
                  ),
                ),
                for (int i = 0; i < 2; i++)
                  ListTile(
                    leading: TextWidget(
                      text: '[Violation $i]',
                      fontSize: 14,
                      fontFamily: 'Bold',
                      color: Colors.red,
                    ),
                    trailing: TextWidget(
                      text: '[Amount]',
                      fontSize: 14,
                      fontFamily: 'Bold',
                      color: Colors.red,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextWidget(
                      text: '[TOTAL]',
                      fontSize: 14,
                      fontFamily: 'Bold',
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ButtonWidget(
                    textColor: Colors.black,
                    radius: 20,
                    width: 300,
                    color: primary,
                    label: 'Print Ticket',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
