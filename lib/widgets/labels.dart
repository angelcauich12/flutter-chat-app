import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String navigationRoute;
  final String title;
  final String subTitle;

  const Labels({
    super.key,
    required this.navigationRoute,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, navigationRoute),
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
