import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';


class Cupertino_Store extends StatefulWidget {
  const Cupertino_Store({Key? key}) : super(key: key);

  @override
  State<Cupertino_Store> createState() => _Cupertino_StoreState();
}

class _Cupertino_StoreState extends State<Cupertino_Store> {

  CupertinoProvider? cpT;
  CupertinoProvider? cpF;


  @override
  Widget build(BuildContext context) {

    cpT = Provider.of<CupertinoProvider>(context,listen: true);
    cpF = Provider.of<CupertinoProvider>(context,listen: false);

    return CupertinoPageScaffold(

      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.house),label: "Products"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart),label: "Cart"),

        ],),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return cpT!.screens[index];
            },
          );

        },

      ),
    );
  }
}