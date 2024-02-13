import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HospitalCard extends StatelessWidget {
  final Function? onMapFunction;
  const HospitalCard({Key? key,this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            onMapFunction!("hospital near me");
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              height: 50,
              width: 50,
              child: Center(
                child: Image.asset("assets/hospital.png",
                  height: 32,
                ),
              ),
            ),
          ),
        ),
        "Hospital".text.bold.make(),
      ],
    ).px16();
  }
}
