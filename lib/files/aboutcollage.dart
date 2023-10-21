import 'package:flutter/material.dart';

import 'websitelink/uietsitelink.dart';

class Aboutsection extends StatefulWidget {
  const Aboutsection({super.key});

  @override
  State<Aboutsection> createState() => _AboutsectionState();
}

class _AboutsectionState extends State<Aboutsection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Center(
              child: Text(
            "About",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 2),
            child: Text(
              "The University Institute of Engineering and Technology was established in 2002 and is an in-campus Department of Panjab University, Chandigarh. The institute has maintained high standards in technical education. The well-qualified faculty is the backbone of the institute.",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Center(
              child: Text(
            "Mission",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 2),
            child: Text(
              "To produce professionally competent students for a career in engineering and technology by providing value-based quality education.",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Center(
            child: InkWell(
                child: Text('for more info click on it',
                    style: TextStyle(
                        color: Colors.blue.shade300,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  Weblink().weblaunch("https://uiet.puchd.ac.in/");
                }),
          ),
        ),
      ],
    );
  }
}
