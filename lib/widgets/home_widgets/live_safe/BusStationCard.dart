import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BusStationCard extends StatelessWidget {
  final Function? onMapFunction;
  const BusStationCard({Key? key,this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onMapFunction!("bus stop near me");
      },
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              height: 50,
              width: 50,
              child: Center(
                child: Image.asset("assets/busStop.png",
                  height: 32,
                ),
              ),
            ),
          ),
          "Bus Stand".text.bold.make(),
        ],
      ).px16(),
    );
  }
}
