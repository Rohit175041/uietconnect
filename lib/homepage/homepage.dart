import 'package:flutter/material.dart';
import '../files/Quicksitelink/uietsitelink.dart';
import '../files/Quicksitelink/websitelist.dart';
import '../files/club/clublist.dart';
import '../files/facultymember/facultylist.dart';
import '../files/researchlab/researchlablist.dart';
import 'MyDrawer.dart';
import 'aboutcollage.dart';
import '../animation/imageslider.dart';
import 'homepagebutton.dart';

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
        backgroundColor: Colors.blue.shade300,
        elevation: 10,
        shadowColor: Colors.blue.shade200,
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
          ImageSlider("img/uiet1.jpg", "img/uiet2.jpg", "img/uiet3.jpg",
              "img/uiet5.jpg", "img/uiet5.jpg"),
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
                    child: HomepageButton(
                        button_name: "Faculty member",
                        image_loaction: "img/lottie/uietfaculty.json"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Clublist(),
                        ),
                      );
                    },
                    child: HomepageButton(
                        button_name: "Club",
                        image_loaction: "img/lottie/club.json"),
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
                          builder: (context) => const ResearchLabList(),
                        ),
                      );
                    },
                    child: HomepageButton(
                        button_name: "Research Lab",
                        image_loaction: "img/lottie/researchlab.json"),
                  ),
                  HomepageButton(
                      button_name: "Placement",
                      image_loaction: "img/lottie/placementcell.json"),
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
                    onTap: () async {
                      Weblink().weblaunch('https://eakadamik.in/uietchd');
                    },
                    child: HomepageButton(
                        button_name: "Result",
                        image_loaction: "img/lottie/result.json"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Websitelist(),
                        ),
                      );
                    },
                    child: HomepageButton(
                        button_name: "Quick Link",
                        image_loaction: "img/lottie/weblink.json"),
                  ),
                ],
              ),
            ),
          ),
          const Aboutsection()
        ],
      )),
      drawer: const DrawerWidget(),
    );
  }
}
