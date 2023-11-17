import 'package:flutter/material.dart';

import '../../services/animatedbutton.dart';
import '../../services/imageslider.dart';

class Clubdetail extends StatefulWidget {
  final dynamic clubname, img1, img2, img3, img4, img5, about, des, link;
  const Clubdetail(
      {super.key,
      required this.clubname,
      required this.img1,
      required this.img2,
      required this.img3,
      required this.img4,
      required this.img5,
      required this.about,
      required this.des,
      required this.link});

  @override
  State<Clubdetail> createState() => _ClubdetailState();
}

class _ClubdetailState extends State<Clubdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(children: [
              ImageSlider(widget.img1, widget.img2, widget.img3, widget.img4,
                  widget.img5),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white.withOpacity(0.8),
                    size: 40,
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
                          widget.clubname,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: Text(
                  "About ${widget.clubname}",
                  style: TextStyle(
                    // fontSize: 20,
                      fontFamily: 'Pacifico',
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "${widget.about}",
                          style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Text("Description",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        widget.des,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Center(
                      child: AnimatedButton(
                          header: 'click for more info',
                          urllink: widget.link),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
