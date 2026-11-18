import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final Icon? prefixIcon;
  final String placeHolder;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomInput({
    super.key,
    this.prefixIcon,
    required this.placeHolder,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),

      child: TextFormField(
        controller: textEditingController,
        obscureText: obscureText,
        autocorrect: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: placeHolder,
        ),
      ),
    );
  }
}
