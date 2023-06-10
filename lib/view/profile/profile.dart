import 'package:flutter/material.dart';
import 'package:diet_app/view/component/bottom_bar.dart';
import 'package:diet_app/theme/t_theme.dart';
import 'package:get/get.dart';
import 'package:diet_app/view/profile/profile_update.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(context) {
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
          "Profile",
          style: DietApp.headline,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
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
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        )),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Maulana",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("amandamaulana00@gmail.com"),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 200,
                child: Container(
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const UpdateProfile()),
                    child: Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DietApp.nearlyDarkBlue,
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 10),
              profileMenu(
                title: "Settings",
                icon: Icons.settings_outlined,
                onPress: () {},
              ),
              profileMenu(
                title: "Subscribe",
                icon: Icons.account_balance_wallet_outlined,
                onPress: () {},
              ),
              profileMenu(
                title: "Management",
                icon: Icons.manage_accounts_outlined,
                onPress: () {},
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 10),
              profileMenu(
                title: "Information",
                icon: Icons.info_outline_rounded,
                onPress: () {},
              ),
              profileMenu(
                  title: "Logout",
                  textColor: Colors.red.shade600,
                  icon: Icons.power_settings_new_sharp,
                  endIcon: false,
                  onPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class profileMenu extends StatelessWidget {
  const profileMenu({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.indigo.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.indigo.shade700,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.grey.shade800).apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey.shade700,
              ))
          : null,
    );
  }
}
