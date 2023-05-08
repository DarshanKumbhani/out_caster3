import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';
import 'package:out_caster3/model/model.dart';

import '../view/cart_screen.dart';
import '../view/product_screen.dart';
import '../view/search_screen.dart';




class CupertinoProvider extends ChangeNotifier
{
  List<Widget> screens = [
    Cupertino_Products(),
    Cupertino_Search(),
    Cupertino_Cart(),
  ];

  List<CupertinoModel> productlist = [
    CupertinoModel(name: "1+ burd",price: 2000,image: "assets/Images/1plus.jpg"),
    CupertinoModel(name: "Traking bag",price: 5000,image: "assets/Images/bag.jpg"),
    CupertinoModel(name: "I-phone",price: 142000,image: "assets/Images/iphone.jpg"),
    CupertinoModel(name: "leptop",price: 456999,image: "assets/Images/leptop.jpg"),
    CupertinoModel(name: "T-Shirt",price: 599,image: "assets/Images/shirt.jpg"),
    CupertinoModel(name: "Watch",price: 98999,image: "assets/Images/watch.jpg"),


  ];

  List<CupertinoModel> cartlist = [];

  double cartheight = 75;
  double totalcart = 0;


  void addcart(int index)
  {
    double subtotal = 0;
    cartheight = (cartlist.length +1 ) * 75;
    CupertinoModel temp = productlist[index];
    cartlist.add(temp);
    cartheight = (cartlist.length +1 ) * 75;
    for(int i = 0 ; i< cartlist.length; i++)
    {
      subtotal = subtotal + cartlist[i].price! ;
    }
    totalcart = subtotal + 31.32 ;

    notifyListeners();
  }



  //DateTime ddate = DateTime.now();
  DateTime sdate = DateTime.now();

  void datechange(DateTime temp)
  {
    sdate = temp;
    notifyListeners();

  }




}