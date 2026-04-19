import 'package:flutter/material.dart';

import 'package:academy_football/coach/GestionEquipesJoueurs.dart';


import 'DataAnalysisPage.dart';
import 'PlanificationEntrainements.dart';
import 'cammunicationPage.dart';

class DashboardCoach extends StatefulWidget {

  @override
  _DashboardCoachState createState() => _DashboardCoachState();
}

class _DashboardCoachState extends State<DashboardCoach> {
  int _currentIndex = 0;

  final List<Widget> _children = [

    GestionEquipesJoueurs(),
    PlanificationEntrainements(),
    CommunicationPage(),
    DataAnalysisPage(),

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

            Text("coach  ",
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
            label: 'GestionEquipesJoueurs',

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'PlanificationEntrainements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Communication',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Statistique',
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

