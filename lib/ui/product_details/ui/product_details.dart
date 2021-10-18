import 'package:ecommerce_fav_cart_app/ui/product_details/providers/product_details_provider.dart';
import 'package:ecommerce_fav_cart_app/utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0,
        title: Text('Product Details'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsetsDirectional.only(
          start: 16,
          end: 16,
          top: 18,
          // bottom: SizeConfig.scaleHeight(10),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.png"), fit: BoxFit.cover),
        ),
        child: Consumer<ProductDetailsProvider>(
          builder: (context, provider, x) {
            return provider.product == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    // Center(
                    //   child: Text(
                    //     'All Products',
                    //     style: TextStyle(
                    //         color: AppColors.MAIN_COLOR,
                    //         fontSize: 23,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 39,
                    // ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 360,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          //   border: Border.all(color: Color(0xFF707070),width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  provider.product.price.toString(),
                                  style: TextStyle(
                                      color: AppColors.MAIN_COLOR,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'SAR',
                                  style: TextStyle(
                                      color: AppColors.MAIN_COLOR,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                // Spacer(),
                                // IconButton(
                                //     onPressed: () {
                                //       Provider.of<DatabaseProvider>(context, listen: false)
                                //           .insertProductInFavourite(provider.product);
                                //     },
                                //     icon: Icon(Icons.favorite_border)),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                // IconButton(
                                //     onPressed: () {
                                //       Provider.of<DatabaseProvider>(context, listen: false)
                                //           .insertProductInCart(provider.product);
                                //     },
                                //     icon: Icon(Icons.shopping_cart)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                height:250,
                                child: Center(child: Image.network(provider.product.image,fit: BoxFit.fill,))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        provider.product.title,
                        style: TextStyle(
                            color: AppColors.MAIN_COLOR,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      provider.product.description,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
