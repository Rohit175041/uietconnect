import 'package:flutter/material.dart';
import '../../animation/animatedbutton.dart';
import '../../animation/imageslider.dart';

class Labdetail extends StatefulWidget {
  final dynamic clubname, img1, img2, img3, img4, img5, about, des, link;
  const Labdetail(
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
  State<Labdetail> createState() => _LabdetailState();
}

class _LabdetailState extends State<Labdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
        elevation: 10,
        shadowColor: Colors.blue.shade200,
        title: Text(
          "${widget.clubname}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlider(widget.img1, widget.img2, widget.img3, widget.img4,
                widget.img5),
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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "${widget.about}",
                    style: const TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.w400),
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
                      color: Colors.black54, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Center(
                child: AnimatedButton(
                    header: 'click for more info', urllink: widget.link),
              ),
            ),
          ],
        ),
      ),
    );
  }
}