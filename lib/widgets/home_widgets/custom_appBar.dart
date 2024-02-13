import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:women_saftey/utils/quotes.dart';

class CustomAppBar extends StatelessWidget {
  final Function? onTap;
  final int? quoteIndex;

  CustomAppBar({this.onTap, this.quoteIndex}); // Define the named parameters in the constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //similar as InkWell , it does not splash while tapping
      onTap:(){
        onTap!();//used null saftey
      }, // Use onTap as needed here
      child: Container(
        child: Text(sweetSayings[quoteIndex ?? 0]).text.textStyle(GoogleFonts.lato()).xl2.make(), // Use quoteIndex as needed here
      ),
    );
  }
}