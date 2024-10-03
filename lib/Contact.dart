import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget{
  @override
  _Contact createState() => _Contact();
}

class _Contact extends State<Contact> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<Offset> _offsetLeft;
  late Animation<Offset> _offsetRight;
  late Animation<Offset> _offsetBT;

  @override
  void initState(){
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetLeft = Tween<Offset>(begin: const Offset(-0.2, 0.0), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _offsetRight = Tween<Offset>(begin: const Offset(0.2, 0.0), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _offsetBT = Tween<Offset>(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context){

    final double width = MediaQuery.of(context).size.width;
    final double height= MediaQuery.of(context).size.height;

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
            Padding(padding: EdgeInsets.all(width * 0.025),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Contact',
                    speed: const Duration(milliseconds: 250),
                    textStyle: GoogleFonts.courierPrime(
                      fontSize: width * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),

            SizedBox(height: height * 0.05),

            Padding(padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
              child: Container(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SlideTransition(
                          position: _offsetLeft,
                          child: Image.asset('assets/github.png', width: width * 0.04, height: width * 0.04)
                        ),
                        SizedBox(width: width * 0.05),
                        SlideTransition(
                          position: _offsetRight,
                          child: TextButton(onPressed: () {
                            html.window.open('https://github.com/omuletzu?tab=repositories', 'Git');
                          }, child: Text('github.com/omuletzu', style: GoogleFonts.courierPrime(fontSize: width * 0.015, color: Colors.purple, fontWeight: FontWeight.bold))), 
                        )
                      ],
                    ),

                    SizedBox(height: height * 0.05),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SlideTransition(
                          position: _offsetLeft,
                          child: Image.asset('assets/linkdn.png', width: width * 0.04, height: width * 0.04),
                        ),
                        SizedBox(width: width * 0.05),
                        SlideTransition(
                          position: _offsetRight,
                            child: TextButton(onPressed: () {
                            html.window.open('https://www.linkedin.com/in/mihnea-simota-155829213/', 'Linkedin');
                          }, child: Text('linkedin.com/in/mihnea-simota-155829213/', style: GoogleFonts.courierPrime(fontSize: width * 0.015, color: Colors.purple, fontWeight: FontWeight.bold))),
                        )
                      ],
                    ),

                    SizedBox(height: height * 0.05),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SlideTransition(
                          position: _offsetLeft,
                          child: Image.asset('assets/discord.png', width: width * 0.04, height: width * 0.04),
                        ),
                        SizedBox(width: width * 0.05),
                        SlideTransition(
                          position: _offsetRight,
                          child: TextButton(onPressed: () {
                            html.window.open('https://discordapp.com/users/490189803833524254', 'Discord');
                          }, child: Text('discordapp.com/users/490189803833524254', style: GoogleFonts.courierPrime(fontSize: width * 0.015, color: Colors.purple, fontWeight: FontWeight.bold))),
                        )
                      ],
                    ),

                    SizedBox(height: height * 0.05),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SlideTransition(
                          position: _offsetLeft,
                          child: Image.asset('assets/mail.png', width: width * 0.04, height: width * 0.04), 
                        ),
                        SizedBox(width: width * 0.05),
                        SlideTransition(
                          position: _offsetRight,
                          child: TextButton(onPressed: () {

                            final Uri uri = Uri(scheme: 'mailto', path: 'mihneasimota1234@gmail.com');
                            launchUrl(uri);

                          }, child: Text('mihneasimota1234@gmail.com', style: GoogleFonts.courierPrime(fontSize: width * 0.015, color: Colors.purple, fontWeight: FontWeight.bold))), 
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.05),

            SlideTransition(
              position: _offsetBT,
              child: Text('> LET\'S GET IN TOUCH <', style: GoogleFonts.courierPrime(fontSize: width * 0.015)),
            )
          ],
        ),
      )
    );
  }
}