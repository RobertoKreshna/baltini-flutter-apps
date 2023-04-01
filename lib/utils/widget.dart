import 'package:baltini_flutter_apps/utils/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyWidget {
  Widget topRow(BuildContext context, bool back, bool fromSearch) {
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
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('assets/icons/icons_24/ic_search.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Search...',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        fromSearch
            ? Container()
            : Expanded(
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
