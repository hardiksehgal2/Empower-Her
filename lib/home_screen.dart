import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:women_saftey/utils/quotes.dart';
import 'package:women_saftey/widgets/home_widgets/customCarouel.dart';
import 'package:women_saftey/widgets/home_widgets/custom_appBar.dart';
import 'package:women_saftey/widgets/home_widgets/emergency.dart';
import 'package:women_saftey/widgets/home_widgets/safehome/SafeHome.dart';
import 'package:women_saftey/widgets/live_safe.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({Key? key}) : super(key: key);
  int qIndex = 0;

  getRandomQuote(){
    Random random=Random();

    //used in changing state
    setState(() {
      qIndex=random.nextInt(sweetSayings.length);
    });
  }
@override
//whenever we restart the app it will call getRandomQuote() function hence providing new quote
  //on every opening
  void initState() {
  getRandomQuote();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 6,bottom: 6)),
              CustomAppBar(
                quoteIndex: qIndex,
                onTap: () {
                  getRandomQuote();
                },
              ),
              Expanded(
                  child: ListView(
                    shrinkWrap:true ,
                    children: [
                      SizedBox(height: 16,),
                      CustomCarouel(),
                      SizedBox(height: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: "Emergency".text.bold.xl3.make(),
                      ),
                      SizedBox(height: 16,),
                      Emergency(),
                      SizedBox(height: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: "Explore LiveSafe".text.bold.xl3.make(),
                      ),
                      SizedBox(height: 16,),
                      LiveSafe(),
                      SafeHome(),
                    ],
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}
