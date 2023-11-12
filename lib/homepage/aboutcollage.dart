import 'package:flutter/material.dart';
import '../../animation/animatedbutton.dart';

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
        title("About"),
        description(
            "The University Institute of Engineering and Technology was established in 2002 under the Department of Panjab University, Chandigarh. \n\nThe institute has maintained high standards in technical education. The well-qualified faculty is the backbone of the institute."),
        title("Mission"),
        description(
            "To produce professionally competent students for a career in engineering and technology by providing value based quality education.\n\nTo develop strong collaboration with academic and research institutes as well as the industry in the country and abroad."),
        Padding(
            padding: const EdgeInsets.all(1.0),
            child: AnimatedButton(
                header: 'click for more info',
                urllink: 'https://uiet.puchd.ac.in')),
        const Padding(
          padding: EdgeInsets.only(bottom: 15.0, left: 12, right: 12),
          child: Center(
            child: Text(
                'Copyrights © 2019, All rights reserved with UIET, Panjab University, Chandigarh.',
                style: TextStyle(
                    color: Colors.black38, fontWeight: FontWeight.normal)),
          ),
        ),
      ],
    );
  }

  Widget title(String data) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Center(
        child: Text(
          data,
          style: TextStyle(
              // fontSize: 20,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold),
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }

  Widget description(String data) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        color: Colors.grey.shade100,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 12, right: 12, bottom: 5),
          child: Text(
            data,
            style: const TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500),
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
