import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
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
                        obscureText: true,
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
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            validation();
                          },
                          child: Text('Register'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('I have already an account!'),
                          // SizedBox(width: 20,),
                          GestureDetector(
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan,
                              ),
                            ),
                          ),
                        ],
                      )
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
