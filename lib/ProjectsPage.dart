import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio_website/GlobalValues.dart';
import 'package:portofolio_website/ProjectSquare.dart';

class ProjectsPage extends StatefulWidget{
  @override
  _ProjectsPage createState() => _ProjectsPage();
}

class _ProjectsPage extends State<ProjectsPage> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _opacity;

  @override
  void initState(){
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _opacity = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context){

    final double width = MediaQuery.of(context).size.width;
    final double height= MediaQuery.of(context).size.height;

    GlobalValues.widthLower = (width > 600);

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight: height,
          minWidth: width
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(222, 230, 232, 0.943),
            Colors.white,
            Color.fromRGBO(222, 230, 232, 0.943)
          ])
        ),

        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.all(width * 0.025),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Projects',
                    speed: const Duration(milliseconds: 250),
                    textStyle: GoogleFonts.courierPrime(
                      fontSize: GlobalValues.widthLower ? width * 0.02 : width * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Text('> REPOS ARE ON MY GITHUB ACCOUNT <', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035)),
            ),

            FadeTransition(
              opacity: _opacity,
              child: SizedBox(
                width: width * 0.75,
                child: GridView.count(
                  crossAxisCount: GlobalValues.widthLower ? 3 : 1,
                  shrinkWrap: true,
                  children: [
                    ProjectSquare(name: 'RandomChain', langs: ['Dart'], gitlink: 'https://github.com/omuletzu/RandomChain', descript: 'Engaging social app where people contribute to themed chains'),
                    ProjectSquare(name: 'DangerMap', langs: ['Dart', 'Kotlin'], gitlink: 'https://github.com/omuletzu/DangerMap', descript: 'App that alerts user of dangers placed on map when closed'),
                    ProjectSquare(name: 'ArtHub', langs: ['Kotlin', 'XML'], gitlink: 'https://github.com/omuletzu/ArtHub', descript: 'A social app for sharing pieces of art'),
                    ProjectSquare(name: 'Langus', langs: ['Kotlin', 'XML'], gitlink: 'https://github.com/omuletzu/Langus', descript: 'Language learning app'),
                    ProjectSquare(name: 'Snake Game ASM', langs: ['Assembly'], gitlink: 'https://github.com/omuletzu/Snake-Game-ASM', descript: 'Snake game made in Assembly'),
                    ProjectSquare(name: 'SkillBoost', langs: ['Dart'], gitlink: 'https://github.com/omuletzu/SkillBoost', descript: 'Handyman demo app with tutorials'),
                    ProjectSquare(name: 'Chess Game', langs: ['Java'], gitlink: 'https://github.com/omuletzu/Chess-Game-Java', descript: 'Chess game made in Java'),
                    ProjectSquare(name: 'Guitar Autotuner', langs: ['Arduino'], gitlink: 'https://github.com/omuletzu/Guitar-Auto-Tuner-Arduino', descript: 'Guitar autotuner for string'),
                    ProjectSquare(name: 'MIPS Processor 32bit', langs: ['VHDL'], gitlink: 'https://github.com/omuletzu/MIPS-Pipeline-Single-Cycle-32bit', descript: 'Both pipeline and single cycle versions on 32bit'),
                  ],
                ),
              ), 
            )
          ],
        ),
      ),
    );
  }
}