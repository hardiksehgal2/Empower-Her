import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  bool loading;

  PrimaryButton(
      {required this.title, required this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60,
      width: double.infinity,

      child: ElevatedButton(
        onPressed: ()=>onPressed(),
        child: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      )
    );
  }
}
