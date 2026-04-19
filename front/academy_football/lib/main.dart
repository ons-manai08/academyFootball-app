import 'package:academy_football/coach/dashbord_coach.dart';
import 'package:academy_football/constant/app_constant.dart';
import 'package:academy_football/login_page.dart';
import 'package:academy_football/parent/dashboard_parent.dart';
import 'package:academy_football/register_page.dart';
import 'package:flutter/material.dart';
import 'package:academy_football/welcome_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bindings/main_binding.dart';
import 'joueur/dashbord_joueur.dart';

const d_red = Colors.black;

late SharedPreferences sharedPreferences;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? userRole = sharedPreferences!.getString(AppConstants.USER_ROLE);
    print("userRole $userRole");
    return GetMaterialApp(
     title: 'AcademyFootball',
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      //methode hedhy t5alik ki taaml login en tant que joueur thezek direct l page ta3ou w ki trefrechi l page i5alik fi wesetha medemk maamltch logOut ,
      // w ki taaml logOut iwali ihezek l page d'acceuil loula
      home:sharedPreferences!.getString(AppConstants.USER_ROLE)=="[ROLE_JOUEUR]"
          ?Dashboard_joueur()
          //:userRole=="[ROLE_COACH]"
         // ?DashboardCoach()
          :sharedPreferences!.getString(AppConstants.USER_ROLE)=="[ROLE_PARENT]"
          ?DashboardParent()
          :WelcomePage(),
    routes: {
     'RegisterPage':(context) => const RegisterPage(),
    'LoginPage': (context) =>  LoginPage(),
     },


    );
  }
}
