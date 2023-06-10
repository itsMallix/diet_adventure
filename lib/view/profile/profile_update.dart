import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:diet_app/theme/t_theme.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: DietApp.nearlyBlack,
          ),
        ),
        title: Text(
          "Edit Profile",
          style: DietApp.headline,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/profile.png"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: DietApp.nearlyDarkBlue,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text('Fullname'),
                          prefixIcon: Icon(
                            Icons.person_rounded,
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
                    SizedBox(height: 10),
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
                    SizedBox(height: 10),
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
                    SizedBox(height: 10),
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
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Container(
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const UpdateProfile()),
                          child: Text("Edit Profile"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DietApp.nearlyDarkBlue,
                            side: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Container(
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const UpdateProfile()),
                          child: Text("Delete Account"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red.shade900,
                            backgroundColor: Colors.red.shade200,
                            side: BorderSide.none,
                          ),
                        ),
                      ),
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
