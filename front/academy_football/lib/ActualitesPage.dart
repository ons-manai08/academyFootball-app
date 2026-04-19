import 'package:academy_football/CategorySelector.dart';
import 'package:academy_football/NewsCarousel.dart';
import 'package:academy_football/TiledNewsView.dart';
import 'package:academy_football/TopBar.dart';
import 'package:academy_football/WelcomeWidget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';





class ActualitesPage extends StatefulWidget {
  const ActualitesPage({ super.key});


  @override
  State<ActualitesPage> createState() => _ActualitesPageState();

}
class _ActualitesPageState extends State<ActualitesPage>{


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // this is to bring the row text in center
          children: <Widget>[

            Text(" Academy  ",
              style: TextStyle(
                  color: Colors.white
              ),
            ),

            Text("News  ",
              style: TextStyle(
                  color: Colors.red
              ),
            ),




          ],

        ),

      ),
      body: SafeArea(
        child: Container(
            width: size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopBar(),
                        SizedBox(height: 10),
                        WelcomeWidget(),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  NewsCarousel(),
                  SizedBox(
                    height: 15,
                  ),
                  CategorySelector(),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [TiledNewsView()],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}



