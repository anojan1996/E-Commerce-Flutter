import 'package:e_commerce/screens/signUp.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
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
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            validation();
                          },
                          child: Text('Login'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('I have not an account!'),
                          // SizedBox(width: 20,),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => SignUp(),
                        ),
                      );
                            },
                            child: const Text(
                              'Register',
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
