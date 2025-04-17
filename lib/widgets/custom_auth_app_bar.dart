import 'package:flutter/material.dart';

AppBar customAuthappBar(BuildContext context, {required String title}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title),
    leading: GestureDetector(
      onTap: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: Icon(Icons.arrow_back_ios_new),
    ),
  );
}
