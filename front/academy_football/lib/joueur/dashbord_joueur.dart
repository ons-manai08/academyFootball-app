import 'package:academy_football/joueur/AccountManagement.dart';
import 'package:flutter/material.dart';
import 'package:academy_football/joueur/TrainingCalendar.dart';
import 'package:academy_football/joueur/Communication.dart';
import 'package:academy_football/joueur/MatchInformation.dart';
import 'package:academy_football/joueur/TrainingTips.dart';




class Dashboard_joueur extends StatefulWidget {
  @override
  _DashboardJoueurState createState() => _DashboardJoueurState();
}

class _DashboardJoueurState extends State<Dashboard_joueur> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    //TrainingCalendar(),
    MatchInformation(),
    TrainingTips(),
    Communication(),
    AccountManagement()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // this is to bring the row text in center
          children: <Widget>[

            Text(" dashbord ",
              style: TextStyle(
                  color: Colors.white
              ),
            ),

            Text("joueur  ",
              style: TextStyle(
                  color: Colors.red
              ),
            ),

          ],

        ),

      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color:Colors.white,),
            label: 'Calendrier',

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Conseils',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Communication',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Compte',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,

    ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
