import 'package:e_commerce/screens/signUp.dart';
import 'package:e_commerce/widgets/button.dart';
import 'package:e_commerce/widgets/changeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  bool obscure = true;
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  // void validation() {
  //   final FormState? _form = _formKey.currentState;
  //   if (_form!.validate()) {
  //     print('yes');
  //   }
  //   print('no');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          // key: _formKey,
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
                        'Login',
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
                      Button(
                          name: 'Login',
                          onpressed: (() async {
                            try {
                              UserCredential result = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: Email.text,
                                      password: Password.text);
                            } catch (e) {
                              print(e);
                            }
                            // {
                            // if (e.code == 'weak-password') {
                            //   print('The password provided is too weak.');
                            // } else if (e.code == 'email-already-in-use') {
                            //   print(
                            //       'The account already exists for that email.');
                            // }
                            // } catch (e) {
                            // print(e);
                            // _scaffoldKey.currentState?.showBottomSheet(
                            //   (context) => Text(e),
                            // );
                          }
                              // }
                              )),
                      ChangeScreen(
                          ontap: (() {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => SignUp(),
                              ),
                            );
                          }),
                          name: 'I have not an account!',
                          account: 'Register')
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
