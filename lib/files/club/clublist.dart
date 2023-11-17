import 'package:flutter/material.dart';
import 'clubdescription.dart';
import 'clubdetails.dart';

class Clublist extends StatefulWidget {
  const Clublist({super.key});

  @override
  State<Clublist> createState() => _ClublistState();
}

class _ClublistState extends State<Clublist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade50,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Stack(children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 3,
                    width: double.infinity,
                    child: Image.asset("img/club/uietclub1.jpg",
                        fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white.withOpacity(0.8),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Card(
                          color: Colors.black.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10, bottom: 10),
                            child: Text(
                              "Student Club",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                ]),
              ]),
            ),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "Student Clubs at a college are attuned to help students get most out of their experience while they are enrolled at the college for their academic pursuits.\nThese student clubs offer limitless opportunities for student leadership and participation beyond classroom setup and academic programme. \n\nThey provide a great platform to usher-in the distinctive perspectives and life experiences that all students bring to the college.\nStudent clubs at college level promote the shaping of skills of the students and make them truly life-ready.",
                        style: TextStyle(fontWeight: FontWeight.w400),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
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
            ),
          ],
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
