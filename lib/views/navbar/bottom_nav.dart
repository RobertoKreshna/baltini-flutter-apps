import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/home/home_page.dart';
import 'package:flutter/material.dart';

import '../account/account_page.dart';
import '../category/category_page_bar.dart';
import '../order/order_page.dart';

class MyNavBar extends StatefulWidget {
  @override
  State<MyNavBar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavBar> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [HomePage(), CategoryPageBar(), OrderPage(), AccountPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(icon: Image.asset(homeactive), label: 'HOME'),
          BottomNavigationBarItem(
              icon: Image.asset(categoryactive), label: 'CATEGORY'),
          BottomNavigationBarItem(
              icon: Image.asset(orderactive), label: 'MY ORDER'),
          BottomNavigationBarItem(
              icon: Image.asset(accountactive), label: 'MY ACCOUNT'),
        ],
      ),
    );
  }
}
