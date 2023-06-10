import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                "assets/banner.png",
                scale: 2,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Get On Board!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "Create your profile to start your journey",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text('Fullname'),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey[900],
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.grey.shade900,
                              ),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text('Username'),
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.grey[900],
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.grey.shade900,
                              ),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text('Email'),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey[900],
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.grey.shade900,
                              ),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text('Password'),
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.grey[900],
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.grey.shade900,
                              ),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey.shade900),
                          child: const Text("SignUp"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage("assets/g.png"),
                            width: 20.0,
                          ),
                          label: const Text(
                            "Signup with Google",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
