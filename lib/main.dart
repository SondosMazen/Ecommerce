import 'package:ecommerce_fav_cart_app/helpers/route_helper.dart';
import 'package:ecommerce_fav_cart_app/tabs_screen.dart';
import 'package:ecommerce_fav_cart_app/ui/cart/data/sqflite_helper.dart';
import 'package:ecommerce_fav_cart_app/ui/cart/providers/database_provider.dart';
import 'package:ecommerce_fav_cart_app/ui/home/providers/home_provider.dart';
import 'package:ecommerce_fav_cart_app/ui/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/product_details/providers/product_details_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.cartDbHelper.initDatabase();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<ProductDetailsProvider>(
          create: (context) => ProductDetailsProvider(),
        ),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (context) => DatabaseProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          navigatorKey: RouteHelper.routeHelper.navKey,
          home: TabBarScreen())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
