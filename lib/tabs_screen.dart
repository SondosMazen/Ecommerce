import 'package:ecommerce_fav_cart_app/ui/cart/ui/cart_page.dart';
import 'package:ecommerce_fav_cart_app/ui/cart/ui/favourite_page.dart';
import 'package:ecommerce_fav_cart_app/ui/home/ui/home_page.dart';
import 'package:ecommerce_fav_cart_app/utlies/app_colors.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {

  static final routeName = 'tabBarScreen';

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': HomePage(),
        'title': 'Home',
      },
      {
        'page': FavouritePage(),
        'title': 'Favorite',
      },
      {
        'page': CartPage(),
        'title': 'Cart',
      },


    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.MAIN_COLOR,
      //   elevation: 0,
      //   title: Text('Home'),
      //   // title: Center(child: Text(_pages[_selectedPageIndex]['title'])),
      // ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.MAIN_COLOR,
        unselectedItemColor: AppColors.HINT_COLOR,
        onTap: _selectPage,
        // backgroundColor: Theme.of(context).primaryColor,
        // selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),

        ],
      ),
    );
  }
}
