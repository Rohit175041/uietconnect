import 'package:flutter/material.dart';
import 'labdescription.dart';
import 'labdetails.dart';

class ResearchLabList extends StatefulWidget {
  const ResearchLabList({super.key});

  @override
  State<ResearchLabList> createState() => _ResearchLabListState();
}

class _ResearchLabListState extends State<ResearchLabList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
        elevation: 10,
        shadowColor: Colors.blue.shade200,
        title: const Text(
          "Research Lab",
          style: TextStyle(fontWeight: FontWeight.bold),
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
                      Image.asset("img/lab/researchlab.jpg"),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            "At UIET, our cutting-edge labs spearhead groundbreaking research. The Neurocognitive Research Lab delves into the intricacies of brain function. Meanwhile, the Computer Vision and Biomedical Device Lab pioneers advanced imaging technologies. The IoT and Sensor Lab are at the forefront of the Internet of Things revolution. \n\nOur Telecommunication Research Lab drives innovations in communication technologies. The Capacity Building Lab focuses on skill enhancement. Lastly, the Maivrik Lab serves as a dynamic hub for multidisciplinary research, contributing significantly to UIET's academic and technological prominence.",
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
                      "img/lab/diclogo.jpg",
                      "Design Innovation Center",
                      "img/lab/dic1.jpg",
                      "img/lab/dic2.jpg",
                      "img/lab/dic3.jpg",
                      "img/lab/dic4.jpg",
                      "img/lab/dic5.jpg",
                      "DIC is thriving center for technology-driven projects, fostering startups,filing patents, and conducting clinical trials.",
                      Labdecription().dic,
                      Labdecription().diclink),
                  imageview(
                      "img/lab/telelabslogo.jpg",
                      "TELELABS",
                      "img/lab/telelab2.jpg",
                      "img/lab/telelab1.jpg",
                      "img/lab/telelab3.jpg",
                      "img/lab/telelab4.jpg",
                      "img/lab/telelab5.jpg",
                      "Brought forth by Ministry of Electronics & Information Technology, Govt. of India, we specialize in network security.",
                      Labdecription().telelabs,
                      Labdecription().telelabslink),
                  imageview(
                      "img/lab/cbreclab.jpg",
                      "Capacity Building Lab",
                      "img/lab/cbreclab.jpg",
                      "img/lab/cbrec1.jpg",
                      "img/lab/cbrec2.jpg",
                      "img/lab/cbrec1.jpg",
                      "img/lab/cbrec3.jpg",
                      "CBREC in AI, Big Data and IoT is set up to enhance the skills and enable youth to get employment opportunities.",
                      Labdecription().cbrec,
                      Labdecription().cbreclink),
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
                builder: (context) => Labdetail(
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
