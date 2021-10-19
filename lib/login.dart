// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tumble/dashboard.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161616),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            constraints: BoxConstraints.tight(MediaQuery.of(context).size),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Image(image: AssetImage('assets/images/LoginLogo.png')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Tumble across something interestin' *wink*",
                        style:
                            TextStyle(color: Color(0xffECDBBA), fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                    height: MediaQuery.of(context).size.height / 2.6,
                  ),
                  Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) => value == "admin" ? null : '',
                            style: TextStyle(
                                color: Color(0xffECDBBA),
                                fontWeight: FontWeight.w100),
                            decoration: InputDecoration(
                                errorText: null,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                filled: true,
                                fillColor: Color(0xff1A1A1A),
                                focusColor: Color(0xff1A1A1A),
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Lato",
                                  color: Color(0xffECDBBA).withOpacity(0.2),
                                )),
                            obscureText: false,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          TextFormField(
                            validator: (value) => value == "admin" ? null : '',
                            style: TextStyle(
                                color: Color(0xffECDBBA),
                                fontWeight: FontWeight.w100),
                            decoration: InputDecoration(
                                errorText: null,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                filled: true,
                                fillColor: Color(0xff1A1A1A),
                                focusColor: Color(0xff1A1A1A),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Lato",
                                  color: Color(0xffECDBBA).withOpacity(0.2),
                                )),
                            obscureText: true,
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffECDBBA),
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                                text: '\nSign Up Here',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => print('Under Construction')),
                          ],
                        ),
                      )),
                      Container(
                        width: 140,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formGlobalKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Invalid Credentials')));
                              }
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffC84B31)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(15)),
                                elevation: MaterialStateProperty.all(0))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
