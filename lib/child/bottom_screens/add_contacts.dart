import 'package:flutter/material.dart';
import 'package:women_saftey/Components/PrimaryButton.dart';
import 'package:women_saftey/child/bottom_screens/contacts_page.dart';

class AddContactsPage extends StatelessWidget {
  const AddContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            PrimaryButton(title: "Add Trusted Cinacts", onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactsPage(),
              ));
            })
          ],
        ),
      ),
    );
  }
}
