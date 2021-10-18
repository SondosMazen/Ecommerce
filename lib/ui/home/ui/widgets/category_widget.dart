import 'package:ecommerce_fav_cart_app/ui/home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  String title;
  CategoryWidget(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Provider.of<HomeProvider>(context, listen: false).selectCategory(title);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Text(
          title.toString()[0].toUpperCase() + title.toString().substring(1),
          style: TextStyle(
              color: Provider.of<HomeProvider>(context).selectedCategory == title
              ? Colors.white
              : Color(0xFF286F2D),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            color: Provider.of<HomeProvider>(context).selectedCategory == title
                ? Color(0xFF286F2D)
                : Colors.white,
            borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
