import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const ButtonBlue({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 17)),
      ),
    );
  }
}
