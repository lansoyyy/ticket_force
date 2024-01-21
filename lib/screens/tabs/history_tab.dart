import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticket_force/widgets/text_widget.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
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
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('enforcers')
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                    )),
                  );
                }

                final data = snapshot.requireData;
                return Padding(
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
                              CircleAvatar(
                                minRadius: 50,
                                maxRadius: 50,
                                backgroundImage: NetworkImage(
                                  data.docs.first['imageDownloadURL'],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text:
                                    '${data.docs.first['firstname']} ${data.docs.first['lastname']}',
                                fontSize: 24,
                                fontFamily: 'Bold',
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text: '${data.docs.first['ID']}',
                                fontSize: 14,
                                fontFamily: 'Medium',
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Record')
                                  .where('uid',
                                      isEqualTo: FirebaseAuth
                                          .instance.currentUser!.uid)
                                  .where('month',
                                      isEqualTo: DateTime.now().month)
                                  .where('day', isEqualTo: DateTime.now().day)
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
                                    )),
                                  );
                                }

                                final record = snapshot.requireData;
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: '${record.docs.length} TICKET/S',
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
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Container(
              width: double.infinity,
              height: 520,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Record')
                              .orderBy('dateTime', descending: true)
                              .where('uid',
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser!.uid)
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
                              height: 500,
                              child: ListView.builder(
                                itemCount: data.docs.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: ListTile(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return SizedBox(
                                              height: 500,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextWidget(
                                                      text: 'Violation List',
                                                      fontSize: 18,
                                                      fontFamily: 'Bold',
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      height: 300,
                                                      child: ListView.builder(
                                                        itemCount: data
                                                            .docs[index]
                                                                ['violations']
                                                            .length,
                                                        itemBuilder:
                                                            (context, index1) {
                                                          return ListTile(
                                                            leading: const Icon(
                                                                Icons.receipt),
                                                            title: TextWidget(
                                                              text: data.docs[
                                                                          index]
                                                                      [
                                                                      'violations']
                                                                  [
                                                                  index1]['name'],
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Bold',
                                                            ),
                                                            trailing:
                                                                TextWidget(
                                                              text: data
                                                                  .docs[index][
                                                                      'violations']
                                                                      [index1]
                                                                      ['amount']
                                                                  .toString(),
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'Medium',
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      leading: Image.asset(
                                          'assets/images/profile.png'),
                                      title: TextWidget(
                                        text: data.docs[index]['name'],
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'Bold',
                                      ),
                                      trailing: TextWidget(
                                        text:
                                            '[${data.docs[index]['license']}]',
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontFamily: 'Regular',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
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
