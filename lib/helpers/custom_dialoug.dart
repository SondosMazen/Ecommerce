import 'package:flutter/material.dart';

import 'route_helper.dart';

class CustomDialoug {
  CustomDialoug._();
  static CustomDialoug customDialoug = CustomDialoug._();
  showCustomDialoug(
      String conteent, String title, Function yesFunction, int id) {
    showDialog(
        context: RouteHelper.routeHelper.navKey.currentContext,
        builder: (context) {
          return AlertDialog(
            content: Text(conteent),
            title: Text(title),
            actions: [
              TextButton(
                  onPressed: () {
                    yesFunction(id);
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'))
            ],
          );
        });
  }
}
