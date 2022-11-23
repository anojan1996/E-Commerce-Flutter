import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/changeScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _SignUpState extends State<SignUp> {
  bool obscure = true;

  TextEditingController UserName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();

  // void validation() async {
  //   // final FormState? _form = _formKey.currentState;
  //   if (_form!.validate()) {
  //     try {
  //       UserCredential result = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(
  //               email: Email.text, password: Password.text);
  //     }  catch (e) {
  //       print(e);
  //     }
  //   }
  //   print('no');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _scaffoldKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 350,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        controller: UserName,
                        validator: (value) {
                          if (value == "") {
                            return "Please fill username";
                          }
                          return null;
                          // elseif(value.length < 6){
                          //   return "Please fill username";
                          // }
                          // return "";
                        },
                        decoration: InputDecoration(
                          hintText: 'User Name',
                          border: const OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextFormField(
                        controller: Email,
                        validator: (value) {
                          if (value == "") {
                            return "Please fill Email";
                          }
                          return null;
                          // elseif(value.length < 6){
                          //   return "Please fill username";
                          // }
                          // return "";
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: const OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextFormField(
                        controller: Password,
                        obscureText: obscure,
                        validator: (value) {
                          if (value == "") {
                            return "Please fill password";
                          }
                          return null;
                          // elseif(value.length < 6){
                          //   return "Please fill username";
                          // }
                          // return "";
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: (() {
                              setState(() {
                                obscure = !obscure;
                              });
                              FocusScope.of(context).unfocus();
                            }),
                            child: Icon(
                              Icons.visibility,
                              color: Colors.black,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextFormField(
                        controller: PhoneNumber,
                        validator: (value) {
                          if (value == "") {
                            return "Please fill phone number";
                          }
                          return null;
                          // elseif(value.length < 6){
                          //   return "Please fill username";
                          // }
                          // return "";
                        },
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: const OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      Button(
                          name: 'Register',
                          onpressed: (() async {
                            try {
                              UserCredential result = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: Email.text,
                                      password: Password.text);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              // print(e);
                              // _scaffoldKey.currentState?.showBottomSheet(
                              //   (context) => Text(e),
                              // );
                            }
                          })),
                      ChangeScreen(
                          ontap: (() {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => Login(),
                              ),
                            );
                          }),
                          name: 'I have an account!',
                          account: 'Login')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
