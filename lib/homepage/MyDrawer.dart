import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../files/Quicksitelink/uietsitelink.dart';
import '../files/login/screens/welcome_screen.dart';
import '../files/userProfile/Profile.dart';
import '../files/userProfile/uploaddata.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.5,
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  SafeArea(
                    child: SizedBox(
                      height: 250,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 2.2,
                              height: 180,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: const CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage("img/uietlogo.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            "UIET-Connect",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              shadows: [
                                Shadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(-3, -2),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              copyToClipboard("directoruiet@pu.ac.in");
                            },
                            child: Text(
                              "directoruiet@pu.ac.in",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(), //DrawerHeader
                  Card(
                    color: Colors.grey.shade100,
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text(' My Profile '),
                      onTap: () async{
                        FirebaseFirestore.instance
                            .collection('uietdep')
                            .doc(user!.uid)
                            .get()
                            .then((DocumentSnapshot documentSnapshot) {
                          if (documentSnapshot.exists) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Profile(),
                              ),
                            );
                          }else{
                           Navigator.pop(context);
                          }
                        });

                      },
                    ),
                  ),
                  Card(
                    color: Colors.grey.shade100,
                    child: ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: const Text(' Create Profile '),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Uploaddata(),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    color: Colors.grey.shade100,
                    child: ListTile(
                      leading: const Icon(Icons.book),
                      title: const Text(' My Courses '),
                      onTap: () {
                        Weblink().weblaunch(
                            'https://uiet.puchd.ac.in/?page_id=3234');
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                  Card(
                    color: Colors.grey.shade100,
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('LogOut'),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        await const FlutterSecureStorage().deleteAll();
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) =>
                                  const WelcomeScreen(),
                            ),
                            (route) => false);
                      },
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            const Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.settings), title: Text('Settings')),
                    ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Help and Feedback'))
                  ],
                ))
          ],
        ),
        // backgroundColor: Colors.grey.shade100,
      ),
    );
  }

  // This function is triggered when the copy icon is pressed
  Future<void> copyToClipboard(String data) async {
    await Clipboard.setData(ClipboardData(text: data));

    if (!mounted) return;
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //   content: Text('Link  Copied'),
    // )
    // );
  }

}
