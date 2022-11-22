import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/widgets/button.dart';
import 'package:flutter/material.dart';

import '../widgets/changeScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  bool obscure = true;
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print('yes');
    }
    print('no');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                                obscure =! obscure;
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
                      Button(name: 'Register', onpressed: validation),
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
