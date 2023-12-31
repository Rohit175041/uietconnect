import 'package:flutter/material.dart';
import '../files/Departments/Departmentslist.dart';
import '../files/Quicksitelink/uietsitelink.dart';
import '../files/Quicksitelink/websitelist.dart';
import '../files/club/clublist.dart';
import '../files/researchlab/researchlablist.dart';
import '../services/imageslider.dart';
import 'MyDrawer.dart';
import 'aboutcollage.dart';
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
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //image slider
          ImageSlider("img/uiet1.jpg", "img/uiet2.jpg", "img/uiet3.jpg",
              "img/uiet5.jpg", "img/uiet5.jpg"),
          Expanded(
              child: ListView(
            children: [
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
                              builder: (context) => const DepartmentsList(),
                            ),
                          );
                        },
                        child: HomepageButton(
                            button_name: "Departments",
                            image_loaction: "img/lottie/uietfaculty.json"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ResearchLabList(),
                            ),
                          );
                        },
                        child: HomepageButton(
                            button_name: "Research Labs",
                            image_loaction: "img/lottie/researchlab.json"),
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
                        child: HomepageButton(
                            button_name: "Clubs",
                            image_loaction: "img/lottie/club.json"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Weblink().weblaunch(
                              'https://uiet.puchd.ac.in/?page_id=2769');
                        },
                        child: HomepageButton(
                            button_name: "Placement",
                            image_loaction: "img/lottie/placementcell.json"),
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
          ))
        ],
      ),
    );
  }
}
