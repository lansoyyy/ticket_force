import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticket_force/screens/tabs/register_driver_tab.dart';
import 'package:ticket_force/utils/colors.dart';
import 'package:ticket_force/widgets/text_widget.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class DriversTab extends StatefulWidget {
  const DriversTab({super.key});

  @override
  State<DriversTab> createState() => _DriversTabState();
}

class _DriversTabState extends State<DriversTab> {
  final searchController = TextEditingController();
  String nameSearched = '';

  final box = GetStorage();

  String id = '';
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      text: 'Drivers',
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: primary,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Regular',
                                fontSize: 14),
                            onChanged: (value) {
                              setState(() {
                                nameSearched = value;
                              });
                            },
                            decoration: InputDecoration(
                                fillColor: primary,
                                filled: true,
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                hintText: 'Search Name/Licensed Number',
                                hintStyle: const TextStyle(
                                    fontFamily: 'Bold',
                                    color: Colors.black,
                                    fontSize: 12),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                            controller: searchController,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Drivers')
                            .where('fname',
                                isGreaterThanOrEqualTo:
                                    toBeginningOfSentenceCase(nameSearched))
                            .where('fname',
                                isLessThan:
                                    '${toBeginningOfSentenceCase(nameSearched)}z')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                          return SizedBox(
                            height: 130,
                            child: ListView.builder(
                              itemCount: data.docs.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    onTap: () {},
                                    leading: Image.asset(
                                        'assets/images/profile.png'),
                                    title: TextWidget(
                                      text: data.docs[index]['fname'] +
                                          ' ' +
                                          data.docs[index]['lname'],
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'Bold',
                                    ),
                                    subtitle: TextWidget(
                                      text: '[${data.docs[index]['license']}]',
                                      fontSize: 12,
                                      color: Colors.red,
                                      fontFamily: 'Regular',
                                    ),
                                    trailing: id == data.docs[index].id
                                        ? IconButton(
                                            onPressed: () {
                                              box.remove('id');
                                              setState(() {
                                                id = '';
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.check_box,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              box.write(
                                                  'id', data.docs[index].id);
                                              setState(() {
                                                id = data.docs[index].id;

                                                index++;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons
                                                  .check_box_outline_blank_outlined,
                                            ),
                                          ));
                              },
                            ),
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'Driver not registered?',
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: 'Regular',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const RegisterDriverTab()));
                          },
                          child: TextWidget(
                            text: 'CLICK HERE',
                            fontSize: 12,
                            color: Colors.blue,
                            fontFamily: 'Bold',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
