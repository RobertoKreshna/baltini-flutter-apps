import 'package:baltini_flutter_apps/utils/components/top_carousel.dart';
import 'package:baltini_flutter_apps/utils/components/top_row.dart';
import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/home/vm/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../product_list/vm/list_vm.dart';
import 'components/exclusive.dart';
import 'components/new_arrival.dart';
import 'components/spotlight_banner.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeVM>(context, listen: false).setProductNewArrival();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TopRow(back: false, fromSearch: false),
              ),
              TopCarousel(),
              Consumer2<HomeVM, ListVM>(
                builder: (context, home, list, child) {
                  return GestureDetector(
                    onTap: () async {
                      list.setFromSearch(false);
                      list.setProduct(home.homeproducts);
                      Navigator.pushNamed(context, '/list');
                    },
                    child: AspectRatio(
                      aspectRatio: 7.0 / 4.0,
                      child: Image.asset(
                        collection,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer2<HomeVM, ListVM>(
                      builder: (context, home, list, child) {
                        return GestureDetector(
                          onTap: () async {
                            await home.setArgs('gender', 'Women');
                            list.setFromSearch(false);
                            list.setProduct(home.argsProducts!);
                            Navigator.pushNamed(context, '/list');
                          },
                          child: Container(
                            height: 275,
                            child: Image.asset(
                              women,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Consumer2<HomeVM, ListVM>(
                      builder: (context, home, list, child) {
                        return GestureDetector(
                          onTap: () async {
                            await home.setArgs('gender', 'Men');
                            list.setFromSearch(false);
                            list.setProduct(home.argsProducts!);
                            Navigator.pushNamed(context, '/list');
                          },
                          child: Container(
                            height: 275,
                            child: Image.asset(
                              men,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SpotlightBanner(spotlight1, 'Stella McCartney'),
              SpotlightBanner(spotlight2, 'Bottega Veneta'),
              SpotlightBanner(spotlight3, 'Stella McCartney'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'NEW ARRIVAL',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Consumer2<HomeVM, ListVM>(
                builder: (context, home, list, child) {
                  return GestureDetector(
                    onTap: () async {
                      list.setFromSearch(false);
                      list.setProduct(home.homeproducts);
                      Navigator.pushNamed(context, '/list');
                    },
                    child: Text(
                      'VIEW ALL',
                      style: TextStyle(
                          fontSize: 12, decoration: TextDecoration.underline),
                    ),
                  );
                },
              ),
              Consumer<HomeVM>(builder: (context, value, child) {
                return NewArrival(value);
              }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'EXCLUSIVE PIECES',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Exclusive(brand1, 'Alexander McQueen', brand1desc),
              Exclusive(brand2, 'Dolce & Gabbana', brand2desc),
              Exclusive(brand3, 'Versace', brand3desc),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 8.0),
                child: Text(
                  'MAGAZINE',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'VIEW ALL',
                  style: TextStyle(
                      fontSize: 12, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
