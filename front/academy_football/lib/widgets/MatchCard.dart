import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchCard extends StatelessWidget {
 String dateMatch;
 String heure;
 String lieux;
 String equipeHome;
 String Adversaire;
  final VoidCallback onClick;
  MatchCard({Key? key,required this.dateMatch,required
  this.heure,required this.lieux,required this.equipeHome,required
  this.Adversaire,required this.onClick}) :
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0),

              ),
            ),
            Icon(Icons.favorite_outline_sharp)
          ],
        ),
      Stack(children:[
      Positioned(child:
      Container(
      height: 183,
        width: 312,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

            )
        ),
      ),
    //price

    Positioned(
    top: 131,
    child:
    Container(
    height: 52,
    width: 312,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateMatch,style:
                GoogleFonts.lato(fontSize: 14,color: Color(0xFF5A532E),fontWeight:
                FontWeight.w500,) ),
                Text(heure.toString(),style:
                GoogleFonts.lato(fontSize: 10,color: Color(0xFF5A532E),fontWeight:
                FontWeight.w300,) ),
                Text(lieux.toString(),style:
                GoogleFonts.lato(fontSize: 10,color: Color(0xFF5A532E),fontWeight:
                FontWeight.w300,) ),
                Text(equipeHome.toString(),style:
                GoogleFonts.lato(fontSize: 10,color: Color(0xFF5A532E),fontWeight:
                FontWeight.w300,) ),
                Text(Adversaire.toString(),style:
                GoogleFonts.lato(fontSize: 10,color: Color(0xFF5A532E),fontWeight:
                FontWeight.w300,) )
              ],
            ),
            GestureDetector(
              onTap: onClick,
              child: Container(
                height: 26,
                width: 78,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFED540)
                ),
                child: Center(
                  child: Text("See More",style:
                  TextStyle(fontSize:12, color: Color(0xFFFFFFFF),fontWeight: FontWeight.w300
                  )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ))
      ])
        ],
        ),
    );}
}