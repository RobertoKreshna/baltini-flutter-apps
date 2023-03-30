import 'package:baltini_flutter_apps/utils/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyWidget {
  Widget topRow(BuildContext context, bool back) {
    return Row(
      children: [
        back
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))
            : Container(),
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
                color: Style.grey, borderRadius: BorderRadius.circular(5.0)),
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 13),
                  icon: Icon(Icons.search),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
                onChanged: (value) {}),
          ),
        ),
        Expanded(
            child: GestureDetector(
          onTap: () {},
          child: Image.asset('assets/icons/icons_44/ic_cart.png'),
        )),
      ],
    );
  }

  Widget topCarousel() {
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
