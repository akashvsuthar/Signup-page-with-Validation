import 'package:flutter/material.dart';
import 'package:my_note/SIGNUP%20PAGE%20WITH%20VALIDATION/AppTypography.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          Text(
            "Welcome to CodeCatch",
            style: AppTypography.txt20,
          )
        ],
      ),
    );
  }
}
