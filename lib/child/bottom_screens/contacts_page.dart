import 'dart:html';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:women_saftey/utils/constants.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
 List<Contact> contacts=[];
 List<Contact> contactsFiltered=[];

 TextEditingController searchController=TextEditingController();
  @override
  void initState(){
    super.initState();
    askPermission();
  }
 String flattenPhoneNumber(String phoneStr) {
   return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
     return m[0] == "+" ? "+" : "";
   });
 }
  filterContacts(){
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((element) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlattren = flattenPhoneNumber(searchTerm);
        String contactName = element.displayName ?? "";
        bool nameMatch = contactName.contains(searchTerm);
        if (nameMatch == true) {
          return true;
        }
        if (searchTermFlattren.isEmpty) {
          return false;
        }
        var phone = element.phones!.firstWhere((p) {
          String phnFLattered = flattenPhoneNumber(p.value!);
          return phnFLattered.contains(searchTermFlattren);
        });
        return phone.value != null;
      });
    }
    setState(() {
      contactsFiltered = _contacts;
    });
  }
Future<void>askPermission() async{
  PermissionStatus permissionStatus=await getContactsPermission();
  if(permissionStatus==PermissionStatus.granted){
    getAllContacts();
    searchController.addListener(() {
      filterContacts();
    });
  }
  else{
    handleInvalidPermissions(permissionStatus);
  }
}
handleInvalidPermissions(PermissionStatus permissionStatus ){
  if(permissionStatus==PermissionStatus.denied){
    dialogueBox(context, "Access to the contacts denied by the user");
  }
  else  if(permissionStatus==PermissionStatus.permanentlyDenied){
    dialogueBox(context, "Contacts may not exists in this device");
  }

}

Future<PermissionStatus>getContactsPermission()async{
  PermissionStatus permission=await Permission.contacts.status;
  if(permission!=PermissionStatus.granted && permission!=PermissionStatus.permanentlyDenied){
    PermissionStatus permissionStatus=await Permission.contacts.request();
    return permissionStatus;
  }
  else{
    return permission;
  }
}
  getAllContacts() async{
    List<Contact> _contacts=await ContactsService.getContacts(
      withThumbnails: false
    );
    setState(() {
      contacts= _contacts;
    });
  }
  @override
  Widget build(BuildContext context) {
    bool isSearching=searchController.text.isNotEmpty;
    bool listItemExit=(contactsFiltered.length>0 || contacts.length>0);
    return Scaffold(
      body:contacts.length==0
          ?Center(child: CircularProgressIndicator())
          : SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    autofocus: true,
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: "Search contact",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                listItemExit==true?
                Expanded(
                  child: ListView.builder(

                      itemCount:isSearching==true
                          ?contactsFiltered.length
                          :contacts.length,
                  itemBuilder: (BuildContext context,int index){
                  Contact contact= isSearching==true
                      ?contactsFiltered[index]
                      :contacts[index];
                  return ListTile(
                    title: Text(contact.displayName!),
                    subtitle: Text(contact.phones!.elementAt(0).value!),
                    leading: contact.avatar!=null && contact.avatar!.length>0?
                    CircleAvatar(

                      backgroundImage: MemoryImage(contact.avatar!),
                    ) :CircleAvatar(
                      backgroundColor: Colors.pink,
                      child: Text(contact.initials()),
                    )
                    ,
                  );
                  }
      ),
                ):Container(
                  child: Text("Searching"),
                ),
              ],
            ),
          ),
    );
  }
}

