import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../style.dart';

class TopCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 36,
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          viewportFraction: 1.0,
        ),
        items: [
          Center(
            child: Text(
              'Free worldwide express shipping on all orders over \$200',
              textAlign: TextAlign.center,
              style: Style.homeCarouselText,
            ),
          ),
          Center(
            child: Text(
              'Subscribe to get our latest and hottest deals',
              textAlign: TextAlign.center,
              style: Style.homeCarouselText,
            ),
          ),
          Center(
            child: Text(
              'Celebrate our 3rd birthday with us and save up to 60% this week',
              textAlign: TextAlign.start,
              style: Style.homeCarouselText,
            ),
          ),
        ],
      ),
    );
  }
}
