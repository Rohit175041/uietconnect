import 'package:flutter/material.dart';
import 'package:uietconnect/files/club/clubdetails.dart';

import 'clubdescription.dart';

class Clublist extends StatefulWidget {
  const Clublist({super.key});

  @override
  State<Clublist> createState() => _ClublistState();
}

class _ClublistState extends State<Clublist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 200,
        centerTitle: true,
        title: const Text(
          "Students Club",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade50,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("img/club/uietclub1.jpg"),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Student Clubs at a college are attuned to help students get most out of their experience while they are enrolled at the college for their academic pursuits. \nThese student clubs offer limitless opportunities for student leadership and participation beyond classroom setup and academic programme. They provide a great platform to usher-in the distinctive perspectives and life experiences that all students bring to the college.\nStudent clubs at college level promote the shaping of skills of the students and make them truly life-ready.",
                            style: TextStyle(fontWeight: FontWeight.w400),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      )
                    ]),
              ),
              Column(
                children: [
                  imageview(
                      "img/club/magboard.jpg",
                      "Magboard",
                      "img/club/ma1.jpg",
                      "img/club/ma2.jpg",
                      "img/club/ma3.jpg",
                      "img/club/ma4.jpg",
                      "img/club/ma5.jpg",
                      "Artistic, Creative, and Literary club of UIET, represents an enchanting realm of creativity, imagination, and expression.",
                      clubdecription().magboard,
                      clubdecription().magboardlink),
                  // imageview(
                  //     "img/club/photography.jpg",
                  //     "Imagen",
                  //     "Photography club of UIET is for people who love to capture beauty with their lenses.",
                  //     "img/club/p1.jpg",
                  //     "img/club/p2.jpg",
                  //     "img/club/p3.jpg",
                  //     "img/club/p4.jpg",
                  //     "img/club/p5.jpg"),
                  imageview(
                      "img/club/mitra.jpg",
                      "MITRA",
                      "img/club/m1.jpg",
                      "img/club/m2.jpg",
                      "img/club/m3.jpg",
                      "img/club/m4.jpg",
                      "img/club/m5.jpg",
                      "It's a student run NGO of UIET that revolve around aim of helping underprivileged child.",
                      clubdecription().mitra1,
                      clubdecription().mitralink),
                  imageview(
                      "img/club/pclub.jpg",
                      "P-Club",
                      "img/club/p1.jpg",
                      "img/club/p2.jpg",
                      "img/club/p3.jpg",
                      "img/club/p4.jpg",
                      "img/club/p5.jpg",
                      "Club for programmers, they handhold you to teaching, helping and promoting practical work.",
                      clubdecription().pclub,
                      clubdecription().pClublink),
                  // imageview(
                  //     "img/club/jugaad.jpg",
                  //     "Jugaad",
                  //     "It is a student-run club aimed at spreading awareness among the students regarding robotics.",
                  //     "img/club/p1.jpg",
                  //     "img/club/p2.jpg",
                  //     "img/club/p3.jpg",
                  //     "img/club/p4.jpg",
                  //     "img/club/p5.jpg"),
                  imageview(
                      "img/club/star.jpg",
                      "STAR",
                      "img/club/s1.jpg",
                      "img/club/s2.jpg",
                      "img/club/s3.jpg",
                      "img/club/s4.jpg",
                      "img/club/s5.jpg",
                      "Student's Team of Alumni Relation a college run committee dealing with Alumi of UIET.",
                      clubdecription().star,
                      clubdecription().starlink),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageview(
      dynamic img,
      String clubname,
      String img1,
      String img2,
      String img3,
      String img4,
      String img5,
      String about,
      String des,
      String link) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Clubdetail(
                  clubname: clubname,
                  img1: img1,
                  img2: img2,
                  img3: img3,
                  img4: img4,
                  img5: img5,
                  about: about,
                  des: des,
                  link: link,
                ),
              ),
            );
          },
          child: ListTile(
            leading: Image.asset(
              img,
              fit: BoxFit.fill,
              height: 80,
              width: 80,
            ),
            title: detail(clubname, about),
            // trailing: const Icon(Icons.account_circle_outlined),
          ),
        ),
      ),
    );
  }

  Widget detail(String clubname, String about) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                clubname,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  about,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                )),
          ),
        ],
      ),
    );
  }
}
