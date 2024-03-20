import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:women_saftey/child/login_screen.dart';
import 'package:women_saftey/utils/constants.dart';

import '../Components/PrimaryButton.dart';
import '../Components/SecondaryButton.dart';
import '../Components/customTextField.dart';
import '../model/user_model.dart';

class RegisterChildScreen extends StatefulWidget {
  @override
  State<RegisterChildScreen> createState() => _RegisterChildScreenState();
}

class _RegisterChildScreenState extends State<RegisterChildScreen> {
  bool isPasswordShown = true;
  bool isRetypePasswordShown= true; 
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  bool isLoading=false;

  _onSubmit() async {
    _formKey.currentState!.save();
    if (_formData['password'] != _formData['rpassword']) {
      dialogueBox(context, "Password and Re-type password should be same");
      print("function is working");
      return; // Exit early if passwords don't match
    }
    else{
      try {
        // Show loading indicator
        progressIndicator(context);
        try {
          setState(() {
            isLoading=true;
          });
          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _formData['cemail'].toString(),
            password: _formData['password'].toString(),
          );
          if(userCredential.user!=null){
            setState(() {
              isLoading=true;
            });
            final v=userCredential.user!.uid;
            DocumentReference<Map<String, dynamic>> db=FirebaseFirestore.instance.collection('usres').doc(v);
            final user=UserModel(
              name: _formData['name'].toString(),
              phone: _formData['phone'].toString(),
              childEmail: _formData['cemail'].toString(),
              parentEmail: _formData['gemail'].toString(),
              id: v,
              type:'child',
            );
            final jsonData=user.toJson();
            await db.set(jsonData);
            Navigator.pop(context);

            // Provide feedback to the user
            dialogueBox(context, "Registration successful. Please login.");

            // Navigate to the login screen
            goTo(context, LoginScreen());
            setState(() {
              isLoading=false;
            });
          }
        } on FirebaseAuthException catch (e) {
          setState(() {
            isLoading=false;
          });
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            dialogueBox(context,  'The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
            dialogueBox(context,  'The account already exists for that email.');
          }
        } catch (e) {
          setState(() {
            isLoading=false;
          });
          print(e);
        }

        // FirebaseAuth auth = FirebaseAuth.instance;
        // await auth.createUserWithEmailAndPassword(
        //   email: _formData['email'].toString(),
        //   password: _formData['password'].toString(),
        // ).then((v) async{});

        // Hide loading indicator

      } on FirebaseAuthException catch(e){
        dialogueBox(context,  e.toString());
      }
      catch(e){
        Navigator.pop(context);
        // Handle other exceptions
        dialogueBox(context, 'Error: ${e.toString()}');
      }
    }
    final email = _formData['email'];
    final password = _formData['password'];
    print(email != null ? email : "Email not provided");
    print(password != null ? password : "Password not provided");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(
            children: [
              isLoading?progressIndicator(context)
                  :
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        "REGISTER AS CHILD".text.xl4.bold.makeCentered(),
                        SizedBox(height: 20),
                        Image.asset(
                          "assets/womens.webp",
                          height: 150,
                          width: 150,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                            hintText: "Enter Name",
                            textInputAction: TextInputAction.next,
                            keyboardtype: TextInputType.name,
                            prefix: Icon(Icons.person),
                            onsave: (name) {
                              _formData['name'] = name ?? "";
                            },
                            validate: (email) {
                              if (email!.isEmpty || email.length < 4 ) {
                                return "Enter correct name";
                              } return null;
                            },
                          ).pOnly(bottom: 20),
                          CustomTextField(
                            hintText: "Enter Phone ",
                            textInputAction: TextInputAction.next,
                            keyboardtype: TextInputType.phone,
                            prefix: Icon(Icons.phone),
                            onsave: (phone) {
                              _formData['phone'] = phone ?? "";
                            },
                            validate: (email) {
                              if (email!.isEmpty || email.length < 10 ) {
                                return "Enter correct phone";
                              } return null;
                            },
                          ).pOnly(bottom: 20),
                          CustomTextField(
                            hintText: "Enter Email",
                            textInputAction: TextInputAction.next,
                            keyboardtype: TextInputType.emailAddress,
                            prefix: Icon(Icons.mail),
                            onsave: (email) {
                              _formData['cemail'] = email ?? "";
                            },
                            validate: (email) {
                              if (email!.isEmpty || email.length < 4 || !email.contains("@")) {
                                return "Enter correct email";
                              } else {
                                return null;
                              }
                            },
                          ).pOnly(bottom: 20),
                          CustomTextField(
                            hintText: "Enter Guardian Email",
                            textInputAction: TextInputAction.next,
                            keyboardtype: TextInputType.emailAddress,
                            prefix: Icon(Icons.mail_lock),
                            onsave: (gemail) {
                              _formData['gemail'] = gemail ?? "";
                            },
                            validate: (email) {
                              if (email!.isEmpty || email.length < 4 || !email.contains("@")) {
                                return "Enter correct email";
                              } else {
                                return null;
                              }
                            },
                          ).pOnly(bottom: 20),
                          CustomTextField(
                            hintText: "Enter Password",
                            isPassword: isPasswordShown,
                            prefix: Icon(Icons.key),
                            onsave: (password) {
                              _formData['password'] = password ?? "";
                            },
                            validate: (password) {
                              if (password!.isEmpty || password.length < 7) {
                                return "Enter password";
                              } else {
                                return null;
                              }
                            },
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordShown = !isPasswordShown;
                                });
                              },
                              icon: isPasswordShown
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ).pOnly(bottom: 20),
                          CustomTextField(
                            hintText: "Retype Password",
                            isPassword: isRetypePasswordShown,
                            prefix: Icon(Icons.key),
                            onsave: (password) {
                              _formData['rpassword'] = password ?? "";
                            },
                            validate: (password) {
                              if (password!.isEmpty || password.length < 7) {
                                return "Enter correct password";
                              } else {
                                return null;
                              }
                            },
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  isRetypePasswordShown = !isRetypePasswordShown;
                                });
                              },
                              icon: isRetypePasswordShown
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ).pOnly(bottom: 20),
                          FilledButton(
                            onPressed: () {},
                            child: PrimaryButton(
                              title: "REGISTER",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _onSubmit();
                                }
                              },
                            ),
                          ).pOnly(bottom: 20),
                        ],
                      ),
                    ),


                    SizedBox(height: 5),
                    SecondaryButton(
                      title: "Existing User?",
                      onPressed: () {
                        goTo(context, LoginScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
