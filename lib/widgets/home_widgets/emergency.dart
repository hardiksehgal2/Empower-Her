import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../emergencies/ArmyEmergency.dart';
import '../emergencies/FirebrigadeEmergency.dart';
import '../emergencies/ambulanceEmergency.dart';
import '../emergencies/policeEmergency.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
          AmbulanceEmergency(),
          FirebrigadeEmergency(),
          ArmyEmergency(),
        ],
      ),
    );
  }
}
