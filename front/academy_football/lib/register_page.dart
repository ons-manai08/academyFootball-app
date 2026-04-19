import 'dart:developer';
import 'dart:html';

import 'package:academy_football/base/showCustomSnackbar.dart';
import 'package:academy_football/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:academy_football/login_page.dart';
import 'package:academy_football/welcome_page.dart';
import 'package:flutter/services.dart';




import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage();
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage>{
  late String _userName;
  late String _email;
  late String _password;
  late String _role = '';

  void _handleRoleChange(String?  value) {
    setState(() {
      _role = value!;
    });
    print(value);
  }

    TextEditingController UserNameController = TextEditingController();
    TextEditingController EmailController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();

    void _registration(){
      String userName= UserNameController.text.trim();
      String Email= EmailController.text.trim();
      String Password= PasswordController.text.trim();
      String Role= _role;


      if(userName.isEmpty){
        showCustomSnackbar("type in your name", title: "userNam");

      } else if (Email.isEmpty){
        showCustomSnackbar("type in your mail", title: "Email");

      } else if (!GetUtils.isEmail(Email)){
        showCustomSnackbar("type in a valid mail", title: "Email");

      } else if (Password.isEmpty){
        showCustomSnackbar("type in your password", title: "Password");

      }else if (Role.isEmpty){
        showCustomSnackbar("type in your role", title: "Role");

      }else {
        print("in else");
        authController.signUp(userName,Email,Password, Role);
        };
    }

    //create the service class object
    Service service = Service();


    void openLoginPage(){
      Navigator.of(context).pushReplacementNamed('LoginPage');
    }

    AuthController authController =Get.find<AuthController>();
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
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Align(
                    alignment: Alignment.center,
                    child: Text('Create New Account  ',
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16,color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //UserName textfieled
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding (
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: UserNameController,
                          //validator: (String value){
                           // if (value.isEmpty){
                             // return 'Please enter your name';
                           // }
                            //return null;
                         // },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'UserName',
                              icon: Icon(Icons.person)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  //Email textfieled
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding (
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: EmailController,
                          //validator: (String value){
                          // if (value.isEmpty){
                          // return 'Please enter your name';
                          // }
                          //return null;
                          // },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                              icon: Icon(Icons.email)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),




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
                          controller: PasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                              icon: Icon(Icons.password_sharp)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),


                  // role radioButon

                  Text(
                    'Rôle',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text(
                            'Parent',
                            style: TextStyle(color: Colors.white), // Définir la couleur du texte
                          ),

                          value: 'parent',
                          groupValue: _role,
                          onChanged: _handleRoleChange,
                          activeColor: Colors.white, // Définir la couleur de la case à cocher
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text(
                            'Coach',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'coach',
                          groupValue: _role,
                          onChanged: _handleRoleChange,
                          activeColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text(
                            'Joueur',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: 'joueur',
                          groupValue: _role,
                          onChanged: _handleRoleChange,
                          activeColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),


                  //sign up  button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () {
                        _registration();
                        },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
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

                  SizedBox(height: 30),

                  //text sign up

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already a member?',style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                      ),
                      ),
                      GestureDetector(
                        onTap: openLoginPage,
                        child:
                        Text('Sign in here ',style: GoogleFonts.robotoCondensed(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        ),

                      ),

                    ],
                  ),


                ],
              ),
            ),
          ),

      );

    }
  }