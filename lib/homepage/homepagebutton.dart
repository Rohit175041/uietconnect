import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomepageButton extends StatefulWidget {
  dynamic button_name;
  dynamic image_loaction;
   HomepageButton({super.key, required this.button_name,required this.image_loaction});

  @override
  State<HomepageButton> createState() => _HomepageButtonState();
}

class _HomepageButtonState extends State<HomepageButton> {
  @override
  Widget build(BuildContext context) {
    double height=130;
    double imgheight=90;
    dynamic button_name_color=Colors.black54;
    return Container(
      height: height,
      width: MediaQuery.sizeOf(context).width / 2.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          Lottie.asset(widget.image_loaction,
              height: imgheight,
              width: MediaQuery.sizeOf(context).width / 2.5),
          Text(
            widget.button_name,
            style: TextStyle(
                color: button_name_color,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
