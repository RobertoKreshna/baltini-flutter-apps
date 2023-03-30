import 'package:baltini_flutter_apps/utils/widget.dart';
import 'package:baltini_flutter_apps/views/home/vm/home_vm.dart';
import 'package:baltini_flutter_apps/views/home/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../product_list/vm/list_vm.dart';
import 'service/home_service.dart';

class HomePage extends StatelessWidget {
  HomeWidget homeWidget = HomeWidget();
  late HomeVM vm;

  HomePage(this.vm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: MyWidget().topRow(context, false),
              ),
              MyWidget().topCarousel(),
              GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, '/list',
                      arguments:
                          ListVM(await HomeService().getNewArrivalProduct()));
                },
                child: AspectRatio(
                  aspectRatio: 7.0 / 4.0,
                  child: Image.asset(
                    'assets/images/collection_banner.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Navigator.pushNamed(context, '/list',
                            arguments: ListVM(await HomeService()
                                .getProductByGender('Women')));
                      },
                      child: Container(
                        height: 275,
                        child: Image.asset(
                          'assets/images/women_banner.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.pushNamed(context, '/list',
                            arguments: ListVM(
                                await HomeService().getProductByGender('Men')));
                      },
                      child: Container(
                        height: 275,
                        child: Image.asset(
                          'assets/images/men_banner.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              homeWidget.spotlightBanner(context,
                  'assets/images/spotlight_banner_1.png', 'Stella McCartney'),
              homeWidget.spotlightBanner(context,
                  'assets/images/spotlight_banner_2.png', 'Bottega Veneta'),
              homeWidget.spotlightBanner(context,
                  'assets/images/spotlight_banner_3.png', 'Stella McCartney'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'NEW ARRIVAL',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, '/list',
                      arguments:
                          ListVM(await HomeService().getNewArrivalProduct()));
                },
                child: Text(
                  'VIEW ALL',
                  style: TextStyle(
                      fontSize: 12, decoration: TextDecoration.underline),
                ),
              ),
              Consumer<HomeVM>(builder: (context, value, child) {
                if (value.products.isEmpty) {
                  value.setProduct();
                }
                vm = value;
                return homeWidget.newArrival(vm);
              }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'EXCLUSIVE PIECES',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              homeWidget.exclusive(
                  context,
                  'assets/images/brand_banner_1.png',
                  'Alexander McQueen',
                  'The Alexander McQueen brand is renowned for its eccentricity and constancy as a high fashion innovator. The company has constantly adopted a gothic, sensual, dark look that is essentially what makes it famous.'),
              homeWidget.exclusive(
                  context,
                  'assets/images/brand_banner_2.png',
                  'Dolce & Gabbana',
                  'Italian designers Domenico Dolce and Stefano Gabbana established the opulent Dolce & Gabbana fashion brand in Legnano in 1985. They debuted their leotard collection in 1988, then in 1989 they started creating swimwear and undergarments.'),
              homeWidget.exclusive(
                  context,
                  'assets/images/brand_banner_3.png',
                  'Versace',
                  'Versace gained recognition on a global scale for his extravagant designs, breathtaking theatrical costumes, and cutting-edge menswear design. Versace\'s fashion incorporated overt eroticism along with elegant classicism.'),
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
