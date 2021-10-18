import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_fav_cart_app/ui/cart/providers/database_provider.dart';
import 'package:ecommerce_fav_cart_app/ui/home/models/all_products_response.dart';
import 'package:ecommerce_fav_cart_app/utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  AllProductsResponse product;
  CartWidget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(10),

      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: CachedNetworkImage(imageUrl: product.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                  style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(product.price.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.MAIN_COLOR,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 5,),

                    Text('SR',style: TextStyle(
                      fontSize: 15,
                      color: AppColors.MAIN_COLOR,
                      fontWeight: FontWeight.w400,
                    ),),

                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Provider.of<DatabaseProvider>(context, listen: false)
                    .deleteProductInCart(product.id);
              },
              icon: Icon(
                Icons.delete,
                size: 35,
                color: Colors.redAccent.shade700,
              ))
        ],
      ),
    );
  }
}
