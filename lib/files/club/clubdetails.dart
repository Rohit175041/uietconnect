import 'package:flutter/material.dart';
import '../collageimage.dart';
import '../websitelink/uietsitelink.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.clubname}",
            style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeImageSlider(widget.img1, widget.img2, widget.img3, widget.img4,
                widget.img5),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: Text(
                  "About ${widget.clubname}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Center(
                child: Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  widget.des,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black87),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Center(
                child: InkWell(
                    child: Text('for more info click on it',
                        style: TextStyle(
                            color: Colors.blue.shade300,
                            fontWeight: FontWeight.bold)),
                    onTap: () {
                      Weblink().weblaunch(widget.link);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
