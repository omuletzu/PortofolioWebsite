import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

class ProjectSquare extends StatelessWidget{

  final String name;
  final String descript;
  final List<String> langs;
  final String gitlink;

  ProjectSquare({required this.name, required this.langs, required this.gitlink, required this.descript});

  @override
  Widget build(BuildContext context){

    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(width * 0.025),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(222, 230, 232, 0.943),
          borderRadius: BorderRadius.circular(50),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: GoogleFonts.courierPrime(fontSize: width * 0.015, color: Colors.purple, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('lang: ', style: GoogleFonts.courierPrime(fontSize: width * 0.015, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                Text('${langs.join(', ')}', style: GoogleFonts.courierPrime(fontSize: width * 0.015), textAlign: TextAlign.center),
              ],
            ),
            Padding(padding: EdgeInsets.all(width * 0.01),
              child: Text(descript, style: GoogleFonts.courierPrime(fontSize: width * 0.015), textAlign: TextAlign.center),
            ),
            TextButton(onPressed: () {

              html.window.open(gitlink, 'Git');

            }, child: Text('> view <', style: GoogleFonts.courierPrime(fontSize: width * 0.015)))
          ],
        ),
      )
    );
  }
}