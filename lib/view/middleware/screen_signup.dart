import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                        controller: fullNameController,
                        validator: (fullname) {
                          if (fullname == " ") {
                            return "Fullname must be filled";
                          } else {
                            return null;
                          }
                        },
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
                        controller: userNameController,
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
                        controller: emailController,
                        validator: (email) {
                          if (email == " ") {
                            return "Email must be filled";
                          }
                        },
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
                        controller: passwordController,
                        obscureText: true,
                        validator: (password) {
                          if (password == " ") {
                            return "Password must be filled";
                          }
                        },
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
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: const Text(
                                  "Your accoun successfully registered!"),
                            );
                            CollectionReference collRef = FirebaseFirestore
                                .instance
                                .collection('account');
                            collRef.add({
                              "full_name": fullNameController.text,
                              "username": userNameController.text,
                              "email": emailController.text,
                              "password": passwordController.text,
                            });
                          },
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
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/==>login");
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account?",
                                  style: TextStyle(color: Colors.grey.shade900),
                                ),
                                TextSpan(text: " Login")
                              ],
                            ),
                          ),
                        ),
                      ),
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
