import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticket_force/screens/home_screen.dart';
import 'package:ticket_force/services/add_record.dart';
import 'package:ticket_force/utils/colors.dart';
import 'package:ticket_force/widgets/button_widget.dart';
import 'package:ticket_force/widgets/text_widget.dart';
import 'package:ticket_force/widgets/toast_widget.dart';

class ApprehensionTab extends StatefulWidget {
  const ApprehensionTab({super.key});

  @override
  State<ApprehensionTab> createState() => _ApprehensionTabState();
}

class _ApprehensionTabState extends State<ApprehensionTab> {
  List<Map<String, dynamic>> violationList = [
    {"Name of Violation": "Beating the red light", "Amount": 1000},
    {"Name of Violation": "Clamping", "Amount": 1000},
    {"Name of Violation": "Colorum", "Amount": 5000},
    {
      "Name of Violation":
          "Driving under the influence of liquor/Narcotic drugs",
      "Amount": 4000
    },
    {"Name of Violation": "Driving without D.L", "Amount": 1500},
    {
      "Name of Violation": "Expired O.R or C.R/No O.R or C.R/Expired D.L",
      "Amount": 2000
    },
    {"Name of Violation": "Failure to carry O.R/C.R", "Amount": 500},
    {
      "Name of Violation":
          "Failure to obey traffic device/traffic enforcers/signs",
      "Amount": 1000
    },
    {"Name of Violation": "Illegal Terminal", "Amount": 5000},
    {
      "Name of Violation":
          "Installation of car stereo, Video Player in PUJs and motorcycles",
      "Amount": 1000
    },
    {"Name of Violation": "Invalid or Delinquent D.L", "Amount": 3000},
    {"Name of Violation": "Involved Traffic Accident", "Amount": 150},
    {
      "Name of Violation": "No Helmet/Non-wearing of Helmet (Back ride)",
      "Amount": 500
    },
    {
      "Name of Violation": "No Helmet/Non-wearing of Helmet (Rider)",
      "Amount": 1000
    },
    {"Name of Violation": "No left turn", "Amount": 1000},
    {"Name of Violation": "No Parking/Illegal Parking", "Amount": 500},
    {"Name of Violation": "No Plate", "Amount": 2000},
    {"Name of Violation": "No Seat Belt", "Amount": 150},
    {"Name of Violation": "No Side Mirror", "Amount": 150},
    {"Name of Violation": "Obstruction", "Amount": 300},
    {"Name of Violation": "Obstruction to sidewalk", "Amount": 500},
    {"Name of Violation": "Operating out of line route", "Amount": 5000},
    {"Name of Violation": "Over speeding/Counterflow", "Amount": 1000},
    {"Name of Violation": "Overloading", "Amount": 500},
    {"Name of Violation": "Parking on side walk", "Amount": 1000},
    {"Name of Violation": "Reckless Driving", "Amount": 2000},
    {
      "Name of Violation": "Smoke belching mufflers, noise controlling device",
      "Amount": 2500
    },
    {
      "Name of Violation": "Smoking banned inside the public vehicle",
      "Amount": 3000
    },
    {
      "Name of Violation":
          "Stopping/standing or parking prohibited in specific places",
      "Amount": 500
    },
    {"Name of Violation": "Top load passenger or cargoes", "Amount": 3000},
    {"Name of Violation": "Trip cutting", "Amount": 5000},
    {"Name of Violation": "Unloading/no-loading", "Amount": 100},
    {
      "Name of Violation":
          "Unregistered Motor/delinquent/invalid/suspended motor",
      "Amount": 2000
    },
    {
      "Name of Violation": "Violation of c.o No. 20-6952 - covid related",
      "Amount": 1000
    },
  ];

  int index = 0;
  final searchController = TextEditingController();
  String nameSearched = '';

  List selected = [];

  final box = GetStorage();
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
                          text: '0 TICKETS',
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
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Drivers')
                      .where('id', isEqualTo: box.read('id'))
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(child: Text('Error'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      );
                    }

                    final data = snapshot.requireData;

                    return Padding(
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
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: 75,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text:
                                              '${data.docs.first['fname']} ${data.docs.first['lname']}',
                                          fontSize: 18,
                                          fontFamily: 'Bold',
                                        ),
                                        TextWidget(
                                          text:
                                              '[${data.docs.first['license']}]',
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
                    );
                  }),
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
                        for (int i = 0; i < violationList.length; i++)
                          SizedBox(
                            width: 300,
                            child: ListTile(
                              leading: selected.contains(violationList[i])
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected.remove(violationList[i]);
                                        });
                                      },
                                      child: const Icon(Icons.check_box))
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected.add(violationList[i]);
                                        });
                                      },
                                      child: const Icon(
                                          Icons.check_box_outline_blank)),
                              title: TextWidget(
                                text: violationList[i]['Name of Violation'],
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
                        print(selected);
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
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Drivers')
              .where('id', isEqualTo: box.read('id'))
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(child: Text('Error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              );
            }

            final data = snapshot.requireData;
            return Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
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
                      TextWidget(
                        text: data.docs.first['fname'] +
                            ' ' +
                            data.docs.first['lname'],
                        fontSize: 24,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: '[${data.docs.first['license']}]',
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: Colors.red,
                        ),
                      ),
                      for (int i = 0; i < selected.length; i++)
                        ListTile(
                          leading: TextWidget(
                            text: '${selected[i]['Name of Violation']}',
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.red,
                          ),
                          trailing: TextWidget(
                            text: '${selected[i]['Amount']}',
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
                          onPressed: () {
                            addRecord(
                                data.docs.first['fname'] +
                                    ' ' +
                                    data.docs.first['lname'],
                                data.docs.first['license'],
                                selected);
                            showToast('Record saved succesfully!');
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
