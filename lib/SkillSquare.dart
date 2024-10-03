import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio_website/GlobalValues.dart';

class SkillSquare extends StatelessWidget{
  final String imageAssetPath;
  final String label;
  final int experience;

  SkillSquare({required this.imageAssetPath, required this.label, required this.experience});

  @override
  Widget build(BuildContext context){

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    String labelFinal = label + '\n($experience years)';

    if(experience < 2){
      labelFinal = label + '\n($experience year)';
    }

    return Padding(padding: EdgeInsets.all(width * 0.045),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(222, 230, 232, 0.943),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAssetPath, height: GlobalValues.widthLower ? width * 0.04 : width * 0.15, width: GlobalValues.widthLower ? width * 0.04 : width * 0.15),
            SizedBox(height: height * 0.01),
            Text(labelFinal, style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.01 : width * 0.025), textAlign: TextAlign.center)
          ],
        ),
      )
    );
  }
}