import 'package:ecommerce_fav_cart_app/ui/cart/providers/database_provider.dart';
import 'package:ecommerce_fav_cart_app/utlies/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: AppColors.MAIN_COLOR,
          title: Center(
              child: Text(
            'Favourite Page',
          )),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<DatabaseProvider>(
                  builder: (context, provider, x) {
                    if (provider.favouriteProdcts == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          childAspectRatio: 3 / 1.8,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: provider.favouriteProdcts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                              //   border: Border.all(color: Color(0xFF707070),width: 1.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                   // blurRadius: 4,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          provider.favouriteProdcts[index].image),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  height: 30,
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15))),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Text(
                                          provider.favouriteProdcts[index].price
                                              .toString(),
                                          style: TextStyle(
                                              color: AppColors.MAIN_COLOR,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'SR',
                                          style: TextStyle(
                                              color: AppColors.MAIN_COLOR,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                    child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    child: IconButton(
                                        onPressed: () {
                                          provider.deleteProductInFavourite(
                                              provider.favouriteProdcts[index].id);
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.redAccent.shade700,
                                          size: 30,
                                        )),
                                  ),
                                ))
                              ],
                            ),
                          );
                        });
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
