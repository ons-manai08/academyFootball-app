
import 'package:academy_football/parent/ContactPage.dart';
import 'package:academy_football/parent/ProfilParent.dart';
import 'package:flutter/material.dart';

import 'Calendrier.dart';
import 'PlanificationEntrainements.dart';






class DashboardParent extends StatefulWidget {

  @override
  _DashboardParentState createState() => _DashboardParentState();
}

class _DashboardParentState extends State<DashboardParent> {
  int _currentIndex = 0;

  final List<Widget> _children = [

  // ScoreMatch(),//les scores des matchs
    PlanificationEntrainement(), //les emplois d'entrainements
    Calendrier(),//les prochaines events, reunions  et matchs
    ContactPage(),
    ProfilParent()//les contacts des autres parents et les coachs




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

            Text("Parents ",
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
            label: 'PlanificationEntrainements',

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Calendrier',
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