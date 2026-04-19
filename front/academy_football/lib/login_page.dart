import 'dart:convert';
import 'package:academy_football/coach/dashbord_coach.dart';
import 'package:academy_football/joueur/dashbord_joueur.dart';
import 'package:academy_football/parent/dashboard_parent.dart';
import 'package:academy_football/register_page.dart';
import 'package:academy_football/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:academy_football/base/showCustomSnackbar.dart';
import 'controller/auth_controller.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({ super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();

}
class _LoginPageState extends State<LoginPage>{
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthController authController = AuthController(Get.find());

  void _login() {
    String userName = _userNameController.text.trim();
    String password = _passwordController.text.trim();

    if (userName.isEmpty) {
      showCustomSnackbar("Type in your UserName",
          title: "User Name");
    } else if (password.isEmpty) {
      showCustomSnackbar("Type in your password",
          title: "Password");
    } else if (password.length < 6) {
      showCustomSnackbar("Password can not be less then 6",
          title: "Password");
    } else {
     authController.signIn(userName, password);
    }
  }

  @override
  void dispose(){
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }
  void openRegisterPage(){
    Navigator.of(context).pushReplacementNamed('RegisterPage');
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:
        const Text('Sign In ', style:   TextStyle(color: Colors.white),   ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                    child:Text(
                      'ACADEMY FOOTBALL',
                      style: TextStyle(fontSize: 30,color: Colors.white),
                    )),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Acceuil',
                  style: TextStyle(fontSize: 20,color: Colors.white),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WelcomePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Login',
                  style: TextStyle(fontSize: 20,color: Colors.white),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Register ',
                  style: TextStyle(fontSize: 20,color: Colors.white),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RegisterPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'dashbord  ',
                  style: TextStyle(fontSize: 20,color: Colors.white),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Dashboard_joueur()));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'dashbord coach  ',
                  style: TextStyle(fontSize: 20,color: Colors.white),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DashboardCoach()));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'dashbord Parents ',
                  style: TextStyle(fontSize: 20,color: Colors.white),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DashboardParent()));
                },
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child:Center(


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //image
              Image.asset('images/logo.png',height: 150,),

              //Email textfieled
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding (
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:TextField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'UserName',
                        icon: Icon(Icons.email)
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),





              //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding (
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                          icon: Icon(Icons.password)
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child : GestureDetector(
                  onTap: (){
                    _login();
                    },
                  child: Container(
                    padding: EdgeInsets.all(16),

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child:
                    Center (child:Text('Sign In ',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      ),
                    ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25  ),

              //text sign up

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not yet a member?',style: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                  ),
                  ),
                  GestureDetector(
                    onTap: openRegisterPage,
                    child:
                    Text('Sign up Now',style: GoogleFonts.robotoCondensed(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    ),

                  ),

                ],
              )
            ],
          ),

        ),
      ),
    );

  }
}





