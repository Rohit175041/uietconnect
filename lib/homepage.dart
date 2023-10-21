import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'files/MyDrawer.dart';
import 'files/aboutcollage.dart';
import 'files/club/Clublist.dart';
import 'files/collageimage.dart';
import 'files/facultymember/facultylist.dart';
import 'files/websitelink/websitelist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "UIET-Connect",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //image slider
          HomeImageSlider("img/uiet1.jpg", "img/uiet2.jpg", "img/uiet3.jpg",
              "img/uiet5.jpg","img/uiet5.jpg"),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //faculty list
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FacuiltyList(),
                        ),
                      );
                    },
                    child: Container(
                      height: 140,
                      width: MediaQuery.sizeOf(context).width / 2.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade100,
                      ),
                      child: Column(
                        children: [
                          Lottie.asset("img/lottie/uietfaculty.json",
                              height: 120,
                              width: MediaQuery.sizeOf(context).width / 2.5),
                          const Text(
                            "faculty member",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      // child: Lottie.asset("img/lottie/weblink.json")
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Websitelist(),
                        ),
                      );
                    },
                    child: Container(
                      height: 140,
                      width: MediaQuery.sizeOf(context).width / 2.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade100,
                      ),
                      child: Column(
                        children: [
                          Lottie.asset("img/lottie/weblink.json",
                              height: 120,
                              width: MediaQuery.sizeOf(context).width / 2.5),
                          const Text(
                            "weblink",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Clublist(),
                        ),
                      );
                    },
                    child: Container(
                      height: 140,
                      width: MediaQuery.sizeOf(context).width / 2.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade100,
                      ),
                      child: Column(
                        children: [
                          Lottie.asset("img/lottie/club.json",
                              height: 120,
                              width: MediaQuery.sizeOf(context).width / 2.5),
                          const Text(
                            "club",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      // child: Lottie.asset("img/lottie/weblink.json")
                    ),
                  ),
                  Container(
                    height: 140,
                    width: MediaQuery.sizeOf(context).width / 2.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey.shade100,
                    ),
                    child: Column(
                      children: [
                        Lottie.asset("img/lottie/placementcell.json",
                            height: 120,
                            width: MediaQuery.sizeOf(context).width / 2.5),
                        const Text(
                          "Placement",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Aboutsection()
        ],
      )
      ),
      drawer: const DrawerWidget(),
    );
  }
}
