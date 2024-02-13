import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void goTo(BuildContext context,Widget nextScreen){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>nextScreen)
  );
}
dialogueBox(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      // Adjust the radius as needed
      child: Container(
        color: Colors.white, // Set the background color of the dialog content
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 50,
              color: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop(); // Close the dialog
        },
        child: Text('OK'),
      ),
    ],
    )
  );

}
void progressIndicator(BuildContext context){
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context)=>Center(child: CircularProgressIndicator(
        backgroundColor: Colors.pinkAccent,
        strokeWidth: 6,
      ))
  );

}
