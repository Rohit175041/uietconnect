import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeImageSlider extends StatelessWidget {
  String img1, img2, img3, img4,img5;
  HomeImageSlider(this.img1, this.img2, this.img3, this.img4,this.img5, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: ImageSlideshow(
        /// Width of the [ImageSlideshow].
        width: double.infinity,

        /// Height of the [ImageSlideshow].
        height: 250,

        /// The page to show when first creating the [ImageSlideshow].
        initialPage: 0,

        /// The color to paint the indicator.
        indicatorColor: Colors.white,

        /// The color to paint behind th indicator.
        indicatorBackgroundColor: Colors.grey,

        /// Called whenever the page in the center of the viewport changes.
        onPageChanged: (value) {
          print('Page changed: $value');
        },

        /// Auto scroll interval.
        /// Do not auto scroll with null or 0.
        autoPlayInterval: 6000,

        /// Loops back to first slide.
        isLoop: true,

        /// The widgets to display in the [ImageSlideshow].
        /// Add the sample image file into the images folder
        children: [
          Screen(img1),
          Screen(img2),
          Screen(img3),
          Screen(img4),
          Screen(img5),
        ],
      ),
    );
  }

  Widget Screen(String data) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.black38,
          image: DecorationImage(
            image: AssetImage(data),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
