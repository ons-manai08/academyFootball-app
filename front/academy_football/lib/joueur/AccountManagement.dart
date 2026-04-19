import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_constant.dart';
import '../controller/auth_controller.dart';
import '../main.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/account_widget.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountManagement extends StatelessWidget {
  const AccountManagement ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController(Get.find());
    return Scaffold(
        body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(bottom: 15),
    child: Column(children: [
    SizedBox(height: Dimensions.heigth10),
    // list of informations
    Center(
    child: Container(
    height: 150,
    width: 150,
    decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(100)),
    child: Icon(
    Icons.person,
    color: Colors.white,
    size: 100,
    ),
    )),

    SizedBox(height: Dimensions.heigth5),
    // expanded column information
    Expanded(
    child: SingleChildScrollView(
    child: Column(
    children: [
    // username
    AccountWidget(
    appIcon: AppIcon(
    icon: Icons.person,
    iconColor: Colors.white,
    backgroundcolor: Colors.black,
    size: 50,
    iconsize: 30,
    ),
    bigText: BigTextWidget(
    text:sharedPreferences!.getString(AppConstants.USER_NAME),
    size: 22,
    ),
    ),
    // phone nember
    AccountWidget(
    appIcon: AppIcon(
    icon: Icons.phone,
    iconColor: Colors.white,
    backgroundcolor: AppColors.yellowColor,
    size: 50,
    iconsize: 30,
    ),
    bigText: BigTextWidget(
    text: "74859685",
    size: 22,
    ),
    ),
    // email adress
    AccountWidget(
    appIcon: AppIcon(
    icon: Icons.mail,
    iconColor: Colors.white,
    backgroundcolor: AppColors.yellowColor,
    size: 50,
    iconsize: 30,
    ),
    bigText: BigTextWidget(
    text: sharedPreferences!.getString(AppConstants.USER_EMAIL),
    size: 20,
    ),
    ),

    // logout
    GestureDetector(
    onTap: () => authController.lougOut(),
    child: AccountWidget(
    appIcon: AppIcon(
    icon: Icons.logout,
    iconColor: Colors.white,
    backgroundcolor: Colors.red.shade400,
    size: 50,
    iconsize: 30,
    ),
    bigText: BigTextWidget(
    text: "Logout",
    size: 22,
    ),
    ),
    ),
    SizedBox(height: Dimensions.heigth15),
    ],
    ),
    ),
    )
    ]),
    ));
  }
}



