import 'package:academy_football/Academy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:academy_football/delayed_animation.dart';
import 'package:academy_football/login_page.dart';
import 'package:academy_football/ActualitesPage.dart';
import 'main.dart';



class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  'Acctualités',
                  style: TextStyle(fontSize: 20,color: Colors.white),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ActualitesPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Academy ',
                  style: TextStyle(fontSize: 20,color: Colors.white),

                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Academy()));
                },
              )
            ],
          ),
        ),
      ),
    backgroundColor: Color(0xFFEDECF2),
    body: SingleChildScrollView(
    child: Container(
    margin: EdgeInsets.symmetric(
    vertical: 60,
    horizontal: 30,
    ),
    child: Column(
    children: [
    DelayedAnimation(
    delay: 1500,
    child: Container(
    height: 170,
    child: Image.asset('images/logo1.png'),

    ),
    ),
    DelayedAnimation(
    delay: 2500,
    child: Container(
    height: 400,
    child: Image.asset('images/img1.png'),
    ),
    ),
    DelayedAnimation(
    delay: 3500,
    child: Container(
    margin: EdgeInsets.only(
    top: 30,
    bottom: 20,
    ),
    child: Text(
    "We want you on our team ",
    textAlign: TextAlign.center,
    style: GoogleFonts.poppins(
    color: Colors.grey,
    fontSize: 30,
    ),

    ),

    ),
    ),
    DelayedAnimation(
    delay: 3500,
    child: Container(
    margin: EdgeInsets.only(
    top: 30,
    bottom: 20,
    ),
    child: Text(
    "Join The Academy  ",
    textAlign: TextAlign.center,
    style: GoogleFonts.poppins(
    color: Colors.grey,
    fontSize: 20,
    ),

    ),

    ),
    ),
    DelayedAnimation(
    delay: 4500,
    child: Container(
    width: double.infinity,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: d_red,
    shape: StadiumBorder(),
    padding: EdgeInsets.all(13)),
    child: Text('GET STARTED'),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => LoginPage(),
    ),
    );
    },
    ),
    ),
    ),
    ],
    ),
    ),
    ),);
        }
        }



