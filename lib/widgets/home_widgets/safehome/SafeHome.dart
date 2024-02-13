import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class SafeHome extends StatelessWidget {
  const SafeHome({Key? key}) : super(key: key);
  showModelSafeHome(BuildContext context){
    showModalBottomSheet(context: context,
        builder: (context){
          return Container(
            height: MediaQuery.of(context).size.height/1.4,
              decoration: BoxDecoration(
                color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
              ),

              // color: Colors.lightBlueAccent,
              // width: MediaQuery.of(context).size.width,

          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>showModelSafeHome(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width*0.7,
          decoration: BoxDecoration(

          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        title: "Send Location".text.bold.make(),
                        subtitle: "Share Location".text.make(),
                      )
                    ],
                  )
              ),
              //we use this widget as it Creates a rounded-rectangular clip.
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/route.jpg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
