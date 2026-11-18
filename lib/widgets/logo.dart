
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String title;

  const Logo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Center(
        child: SizedBox(
          width: 170,
          child: Column(
            children: [
              Image(image: AssetImage('assets/img/tag-logo.png')),
              SizedBox(height: 20),
              Text(title, style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}