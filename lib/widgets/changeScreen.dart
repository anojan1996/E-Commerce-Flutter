import 'package:flutter/material.dart';

import '../screens/signUp.dart';

class ChangeScreen extends StatelessWidget {
  late final VoidCallback ontap;
  late final String name;
  late final String account;
  ChangeScreen({required this.ontap, required this.name, required this.account});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(name),
        // SizedBox(width: 20,),
        GestureDetector(
          onTap: ontap,
          child:  Text(
            account,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
            ),
          ),
        ),
      ],
    );
  }
}
