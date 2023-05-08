import 'package:flutter/material.dart';
import 'package:out_caster3/provider/provider.dart';
import 'package:out_caster3/view/cart_screen.dart';
import 'package:out_caster3/view/home_screen.dart';
import 'package:out_caster3/view/product_screen.dart';
import 'package:out_caster3/view/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context) => CupertinoProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => Cupertino_Store(),
          "ios_setting": (context) => Cupertino_Products(),
          "cupertinostore":(context) => Cupertino_Cart(),
          "appstore":(context) => Cupertino_Search(),
        },
      ),
    )
  );
}

