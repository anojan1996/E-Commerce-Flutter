import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  late final VoidCallback onpressed;
  late final String name;

  Button({required this.name, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(name),
      ),
    );
  }
}
