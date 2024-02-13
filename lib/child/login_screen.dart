import 'package:flutter/material.dart';
import 'package:women_saftey/Components/PrimaryButton.dart';
import 'package:women_saftey/Components/SecondaryButton.dart';
import 'package:women_saftey/Components/customTextField.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:women_saftey/child/register_child.dart';
import 'package:women_saftey/parent/parent_register_screen.dart';
import 'package:women_saftey/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordShown = true;
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  _onSubmit() {
    _formKey.currentState!.save();
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
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      "USER LOGIN".text.xl4.bold.makeCentered(),
                      SizedBox(height: 20,),
                      Image.asset(
                        "assets/womens.webp",
                        height: 150,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40), // Added SizedBox for spacing

                Container(
                  //height:  MediaQuery.of(context).size.height*0.4,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextField(
                          hintText: "Enter Email",
                          textInputAction: TextInputAction.next,
                          keyboardtype: TextInputType.emailAddress,
                          prefix: Icon(Icons.person),
                          onsave: (email) {
                            _formData['email'] = email ?? "";
                          },
                          validate: (email) {
                            if (email!.isEmpty || email.length < 4 || !email.contains("@")) {
                              return "Enter correct email";
                            } else {
                              return null;
                            }
                          },
                        ).pOnly(bottom: 40),
                        CustomTextField(
                          hintText: "Enter Password",
                          isPassword: isPasswordShown,
                          prefix: Icon(Icons.key),
                          onsave: (password) {
                            _formData['password'] = password ?? "";
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
                                isPasswordShown = !isPasswordShown;
                              });
                            },
                            icon: isPasswordShown
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                        ).pOnly(bottom: 40),
                        FilledButton(
                          onPressed: () {},
                          child: PrimaryButton(
                            title: "Login",
                            onPressed: () {
                              progressIndicator(context);
                              // if (_formKey.currentState!.validate()) {
                              //   _onSubmit();
                              // }
                            },
                          ),
                        ).pOnly(bottom: 40),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30), // Added SizedBox for spacing

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Forgot Password?".text.make(),
                      SecondaryButton(title: "Click Here", onPressed: () {}),
                    ],
                  ),
                ),
                SizedBox(height: 40), // Added SizedBox for spacing

                SecondaryButton(
                  title: "Register as Child",
                  onPressed: () {
                    goTo(context, RegisterChildScreen());
                  },
                ),
                SecondaryButton(
                  title: "Register as Parent",
                  onPressed: () {
                    goTo(context, RegisterParentScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
