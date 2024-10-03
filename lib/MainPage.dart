import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio_website/GlobalValues.dart';
import 'package:portofolio_website/HomePage.dart';
import 'AboutMePage.dart';
import 'ProjectsPage.dart';
import 'Contact.dart';

class MainPage extends StatefulWidget{

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Offset> _offsetTB;
  late Animation<double> _opacity;

  Widget currentPage = HomePage();

  late InkWell projectsButton;

  @override
  void initState(){
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _offsetTB = Tween<Offset>(begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0)).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _opacity = Tween<double>(begin: 0.1, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context){

    final double width = MediaQuery.of(context).size.width;

    GlobalValues.widthLower = (width > 600);

    projectsButton = InkWell(
      onTap: () {
        setState(() {
          currentPage = ProjectsPage();
        });
      },

      onHover: (value) {
        if(value){
                        
        }
      },

      borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
      splashColor: const Color.fromARGB(255, 178, 2, 222),
      highlightColor: Colors.purple.withOpacity(0.1),

      child: Padding(padding: EdgeInsets.all(width * 0.01),
        child: Text('Projects', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035)),
      ),
    );

    _animationController.forward();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.075,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(222, 230, 232, 0.943),
              Colors.white,
              Color.fromRGBO(222, 230, 232, 0.943),
            ])  
          ),
        ),
        title: Padding(padding: EdgeInsets.only(top: GlobalValues.widthLower ? width * 0.01 : width * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SlideTransition(position: _offsetTB,
                child: FadeTransition(opacity: _opacity,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentPage = HomePage();
                      });
                    },

                    onHover: (value) {
                      if(value){
                        
                      }
                    },

                    borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
                    splashColor: Color.fromARGB(255, 178, 2, 222),
                    highlightColor: Colors.purple.withOpacity(0.1),

                    child: Padding(padding: EdgeInsets.all(width * 0.01),
                      child: Text('Home', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035)),
                    ),
                  ),
                ),
              ),

              SizedBox(width: width * 0.035),
              SlideTransition(position: _offsetTB,
                child: FadeTransition(opacity: _opacity,
                  child: const Text('|')
                ),
              ),
              SizedBox(width: width * 0.035),

              SlideTransition(position: _offsetTB,
                child: FadeTransition(opacity: _opacity,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentPage = AboutMePage(projectsOnTap: tapProjectsButton);
                      });
                    },

                    onHover: (value) {
                      if(value){
                        
                      }
                    },

                    borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
                    splashColor: Color.fromARGB(255, 178, 2, 222),
                    highlightColor: Colors.purple.withOpacity(0.1),

                    child: Padding(padding: EdgeInsets.all(width * 0.01),
                      child: Text('About me', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035)),
                    ),
                  ),
                ),
              ),

              SizedBox(width: width * 0.035),
              SlideTransition(position: _offsetTB,
                child: FadeTransition(opacity: _opacity,
                  child: const Text('|')
                ),
              ),
              SizedBox(width: width * 0.035),

              SlideTransition(position: _offsetTB,
                child: FadeTransition(opacity: _opacity,
                  child: projectsButton,
                ),
              ),

              SizedBox(width: width * 0.035),
              SlideTransition(position: _offsetTB,
                child: FadeTransition(opacity: _opacity,
                  child: const Text('|')
                ),
              ),
              SizedBox(width: width * 0.035),

              SlideTransition(position: _offsetTB,
                child: FadeTransition(opacity: _opacity,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentPage = Contact();
                      });
                    },

                    onHover: (value) {
                      if(value){
                        
                      }
                    },

                    borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
                    splashColor: Color.fromARGB(255, 178, 2, 222),
                    highlightColor: Colors.purple.withOpacity(0.1),

                    child: Padding(padding: EdgeInsets.all(width * 0.01),
                      child: Text('Contact', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),

      body: currentPage
    );
  }

  void tapProjectsButton(){
    setState(() {
      currentPage = ProjectsPage();
    });
  }
}