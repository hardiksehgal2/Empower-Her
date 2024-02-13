import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:velocity_x/velocity_x.dart';

class FirebrigadeEmergency extends StatelessWidget {
  const FirebrigadeEmergency({Key? key}) : super(key: key);

  _callNumber(String number) async{

    await FlutterPhoneDirectCaller.callNumber(number);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFD8080),
                Color(0xFFFB8580),
                Color(0xFFFBD079),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Image.asset("assets/flames.png"),
                  radius: 25,
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
                Expanded( // Wrap the Column with Expanded
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Fire Emergency".text.white.bold
                          .size(MediaQuery.of(context).size.width * 0.06)
                          .make(),
                      "In case of fire emergency".text.white
                          .size(MediaQuery.of(context).size.width * 0.06)
                          .make(),
                      InkWell(
                        onTap:()=>_callNumber("101") ,
                        child: Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: "101".text.red800.xl.bold.makeCentered(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
