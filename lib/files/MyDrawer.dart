import 'package:flutter/material.dart';
import 'package:uietconnect/files/websitelink/uietsitelink.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.5,
      child: Drawer(
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
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage("img/uietlogo.jpg"),
                        ),
                      ),
                    ),
                    const Text(
                      "UIET-Connect",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "directoruiet@pu.ac.in",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Courses '),
              onTap: () {
                Weblink()
                    .weblaunch('https://uiet.puchd.ac.in/?page_id=3234');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
