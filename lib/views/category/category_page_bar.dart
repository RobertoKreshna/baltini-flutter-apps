import 'package:baltini_flutter_apps/utils/components/top_row.dart';
import 'package:baltini_flutter_apps/views/category/category_page.dart';
import 'package:baltini_flutter_apps/views/category/vm/category_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPageBar extends StatefulWidget {
  const CategoryPageBar({super.key});

  @override
  State<CategoryPageBar> createState() => _CategoryPageBarState();
}

class _CategoryPageBarState extends State<CategoryPageBar>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TopRow(false, false),
            ),
            Consumer<CategoryVM>(
              builder: (context, value, child) {
                return TabBar(
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "WOMEN",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "MEN",
                      ),
                    ),
                  ],
                  onTap: (index) {
                    value.toggleGender();
                  },
                  controller: _controller,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                );
              },
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  CategoryPage(),
                  CategoryPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
