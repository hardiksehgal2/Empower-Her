import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: "Parent Home screen".text.make(),
      ),
    );
  }
}
