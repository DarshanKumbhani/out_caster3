import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/provider.dart';

class Cupertino_Cart extends StatefulWidget {
  const Cupertino_Cart({Key? key}) : super(key: key);

  @override
  State<Cupertino_Cart> createState() => _Cupertino_CartState();
}

class _Cupertino_CartState extends State<Cupertino_Cart> {
  TextEditingController name = TextEditingController(text: "Name");
  TextEditingController email = TextEditingController(text: "Email");
  TextEditingController location = TextEditingController(text: "Location");
  CupertinoProvider? cpT;
  CupertinoProvider? cpF;

  @override
  Widget build(BuildContext context) {
    cpT = Provider.of<CupertinoProvider>(context, listen: true);
    cpF = Provider.of<CupertinoProvider>(context, listen: false);

    return CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text("Cupertion Store", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.black,
                  inherit: false
                ),),
              ),
                SizedBox(height: 10,),
              TabsFields(icon: CupertinoIcons.person_alt, controller: name),
              TabsFields(icon: CupertinoIcons.mail_solid, controller: email),
              TabsFields(
                  icon: CupertinoIcons.location_solid, controller: location),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 15),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.stopwatch_fill,
                      color: CupertinoColors.systemGrey3,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Delivery time",
                      style: TextStyle(
                          color: CupertinoColors.systemGrey3,
                          fontSize: 15,
                          inherit: false),
                    ),
                    Spacer(),
                    Text(
                      "${cpT!.sdate.day} / ${cpT!.sdate.month} / ${cpT!.sdate
                          .year}  ${cpT!.sdate.hour} : ${cpT!.sdate.minute}",
                      style: TextStyle(
                          color: CupertinoColors.systemGrey3,
                          fontSize: 15,
                          inherit: false),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 220,
                  child: CupertinoDatePicker(
                    onDateTimeChanged: (value) {
                      DateTime? temp;
                      temp = value;
                      cpF!.datechange(temp);
                    },
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: DateTime.now(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Padding TabsFields({
    TextEditingController? controller,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: CupertinoTextField(
        prefix: Icon(
          icon,
          color: CupertinoColors.systemGrey3,
          size: 20,
        ),
        style: TextStyle(color: CupertinoColors.systemGrey3, fontSize: 15),
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: BoxDecoration(
            border:
            Border(bottom: BorderSide(color: CupertinoColors.systemGrey3))),
      ),
    );
  }
}
