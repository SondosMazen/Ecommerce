import 'package:ecommerce_fav_cart_app/ui/cart/providers/database_provider.dart';
import 'package:ecommerce_fav_cart_app/utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  String label;
Function function;
  CustomButton({
    this.label,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return
      Stack(alignment: Alignment.center, children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        height: 55,
        width: 160,
      ),
      Container(
        height: 45,
        width: 150,
        child: PositionedDirectional(
          child: OutlinedButton(
            //onPressed: () => function,
             // onPressed: () {

            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  AppColors.MAIN_COLOR),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30.0))),
            ),
            child: Text(

              label,
              style:
              TextStyle(fontSize: 16,
                  color: Colors.white),
            ),

          ),
        ),
      ),
    ]);
  }
}