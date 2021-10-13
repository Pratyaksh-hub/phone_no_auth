import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Final extends StatelessWidget {
  const Final({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Work Done",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
