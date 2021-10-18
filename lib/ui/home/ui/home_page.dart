import 'dart:ui';
import 'package:ecommerce_fav_cart_app/ui/home/models/all_products_response.dart';
import 'package:ecommerce_fav_cart_app/ui/home/providers/home_provider.dart';
import 'package:ecommerce_fav_cart_app/ui/home/ui/widgets/category_widget.dart';
import 'package:ecommerce_fav_cart_app/ui/home/ui/widgets/product_widget.dart';
import 'package:ecommerce_fav_cart_app/ui/product_details/providers/product_details_provider.dart';
import 'package:ecommerce_fav_cart_app/ui/product_details/ui/product_details.dart';
import 'package:ecommerce_fav_cart_app/utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_slider/image_slider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        title: Center(child: Text('Home')),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.png"), fit: BoxFit.cover),
        ),
        child: Consumer<HomeProvider>(
          builder: (context, provider, x) {
            List<AllProductsResponse> allProducts = provider.allProducts;

            List<AllProductsResponse> products = provider.categoryProducts;
            List<dynamic> categories = provider.allCategories;

            return Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 45,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 55,
                          width: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: AppColors.MAIN_COLOR),
                              color: AppColors.MAIN_COLOR,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            //scrollPadding: EdgeInsets.all(0),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            //validator: (v) =>  Provider.of<AuthProvider>(context, listen: false).nullValidate(v),
                            // onSaved: (v) => save(v),
                            obscureText: false,
                            //controller: this.controller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                // borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(width: 2, color: AppColors.MAIN_COLOR),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: AppColors.MAIN_COLOR),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                             // suffixIcon: suffixicon,
                              labelText: 'Search here',
                              labelStyle:
                              TextStyle(fontSize: 14, color: AppColors.MAIN_COLOR),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  allProducts == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      //   border: Border.all(color: Color(0xFF707070),width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                    child: ImageSlider(
                      /// Shows the tab indicating circles at the bottom
                      showTabIndicator: true,

                      /// Cutomize tab's colors
                      tabIndicatorColor: AppColors.HINT_COLOR,

                      /// Customize selected tab's colors
                      tabIndicatorSelectedColor: AppColors.MAIN_COLOR,

                      /// Height of the indicators from the bottom
                      // tabIndicatorHeight: 16,
                      tabIndicatorHeight: 20,

                      /// Size of the tab indicator circles
                      tabIndicatorSize: 10,

                      /// tabController for walkthrough or other implementations
                      tabController: tabController,

                      /// Animation curves of sliding
                      curve: Curves.fastOutSlowIn,

                      /// Width of the slider
                      width: 80,

                      /// Height of the slider
                      height: 180,

                      /// If automatic sliding is required
                      autoSlide: true,

                      /// Time for automatic sliding
                      duration: new Duration(seconds: 10),

                      /// If manual sliding is required
                      allowManualSlide: true,

                      /// Children in slideView to slide
                      children: allProducts.take(4).map((e) {
                        return new GestureDetector(
                          onTap: () {

                          },
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Get',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    '30% Discount',
                                    style: TextStyle(
                                        color: AppColors.MAIN_COLOR,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    e.price.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.only(),
                                child: Image.network(
                                  e.image,
                                  width: 160,
                                  height: 160,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // Text(
                  //   'All Categories',
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  // ),
                  categories == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: provider.allCategories.map((e) {
                              return CategoryWidget(e);
                            }).toList(),
                          ),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  products == null
                      ? Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: products.length,

                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Provider.of<ProductDetailsProvider>(context,
                                              listen: false)
                                          .getProductResponse(products[index].id);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return ProductDetails();
                                      }));
                                    },
                                    child: ProductWidget(products[index]));
                              }),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
