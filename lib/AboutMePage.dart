import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portofolio_website/GlobalValues.dart';
import 'package:portofolio_website/SkillSquare.dart';
import 'dart:html' as html;
import 'package:visibility_detector/visibility_detector.dart';

class AboutMePage extends StatefulWidget{

  void Function() projectsOnTap;

  AboutMePage({required this.projectsOnTap}); 

  @override
  _AboutMePage createState() => _AboutMePage();
}

class _AboutMePage extends State<AboutMePage> with TickerProviderStateMixin{

  late AnimationController _animationControllerIntro;
  late Animation<Offset> _offsetLeftIntro;
  late Animation<Offset> _offsetRightIntro;

  late AnimationController _animationControllerTech;
  late Animation<Offset> _offsetLeftTech;
  late Animation<Offset> _offsetRightTech;

  late AnimationController _animationControllerSoft;
  late Animation<Offset> _offsetLeftSoft;
  late Animation<Offset> _offsetRightSoft;

  late AnimationController _animationControllerVolunteer;
  late Animation<Offset> _offsetLeftVolunteer;
  late Animation<Offset> _offsetRightVolunteer;

  late AnimationController _animationTechOpacity;
  late Animation<double> _opacityTech;

  late AnimationController _animationSoftOpacity;
  late Animation<double> _opacitySoft;

  late AnimationController _animationVolunteerOpacity;
  late Animation<double> _opacityVolunteer;

  late AnimationController _animationControllerImage;
  late Animation<double> _offsetImage;

  @override
  void initState(){
    super.initState();

    _animationControllerIntro = getController();
    _offsetLeftIntro = getOffsetLeft(_animationControllerIntro);
    _offsetRightIntro = getOffsetRight(_animationControllerIntro);
    _animationControllerIntro.forward();

    _animationControllerTech = getController();
    _offsetLeftTech = getOffsetLeft(_animationControllerTech);
    _offsetRightTech = getOffsetRight(_animationControllerTech);
    _animationControllerTech.forward();

    _animationControllerSoft = getController();
    _offsetLeftSoft = getOffsetLeft(_animationControllerSoft);
    _offsetRightSoft = getOffsetRight(_animationControllerSoft);
    _animationControllerSoft.forward();

    _animationControllerVolunteer = getController();
    _offsetLeftVolunteer = getOffsetLeft(_animationControllerVolunteer);
    _offsetRightVolunteer = getOffsetRight(_animationControllerVolunteer);
    _animationControllerVolunteer.forward();

    _animationTechOpacity = getController();
    _opacityTech = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: _animationTechOpacity, curve: Curves.easeInOut),
    );

    _animationSoftOpacity = getController();
    _opacitySoft = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: _animationSoftOpacity, curve: Curves.easeInOut),
    );

    _animationVolunteerOpacity = getController();
    _opacityVolunteer = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: _animationVolunteerOpacity, curve: Curves.easeInOut),
    );

    _animationControllerImage = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _offsetImage = Tween<double>(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(parent: _animationControllerImage, curve: Curves.easeInOut),
    );
  }

  AnimationController getController(){
    return AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  Animation<Offset> getOffsetLeft(AnimationController _animationController){
    return Tween<Offset>(begin: const Offset(-0.1, 0.0), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  Animation<Offset> getOffsetRight(AnimationController _animationController){
    return Tween<Offset>(begin: const Offset(0.1, 0.0), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context){

    final double width = MediaQuery.of(context).size.width;
    final double height= MediaQuery.of(context).size.height;

    List<Widget> listForDetails = [
      SlideTransition(
        position: _offsetLeftIntro,
        child: AnimatedBuilder(
          animation: _animationControllerImage,
          builder: (context, child) {
            
            return Transform.translate(
              offset: Offset(0, _offsetImage.value),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: GlobalValues.widthLower ? width * 0.125 : width * 0.4,
                  minWidth: GlobalValues.widthLower ? width * 0.125 : width * 0.4,
                  maxHeight: GlobalValues.widthLower ? width * 0.125 : width * 0.4,
                  maxWidth: GlobalValues.widthLower ? width * 0.125 : width * 0.4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.05)),
                  border: const Border(bottom: BorderSide(color: Colors.purpleAccent, width: 5)),
                  color: Colors.purple.withOpacity(0.025),
                  image: const DecorationImage(
                    image: AssetImage('assets/file.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),

      SizedBox(width: width * 0.05, height: width * 0.05),

      Column(
        //mainAxisAlignment: GlobalValues.widthLower ? MainAxisAlignment.start : MainAxisAlignment.center,
        crossAxisAlignment: GlobalValues.widthLower ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.all(width * 0.01),
            child: SlideTransition(
              position: _offsetRightIntro,
              child: Text(
                '> Simota Mihnea',
                style: GoogleFonts.courierPrime(
                  textStyle: TextStyle(
                    fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.055,
                    color: const Color.fromARGB(255, 178, 2, 222),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.center
              )
            ),
          ),

          Padding(
            padding: EdgeInsets.all(width * 0.01),
            child: SlideTransition(
              position: _offsetRightIntro,
              child: Text('> 3rd year Computer Science student at\nTechnical University of Cluj-Napoca', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035), textAlign: TextAlign.center)
            ),
          ),

          Padding(
            padding: EdgeInsets.all(width * 0.01),
            child: SlideTransition(
              position: _offsetRightIntro,
              child: Text('> Full Stack Developer working on mobile apps, websites and java apps', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035), textAlign: TextAlign.center)
            ),
          )
        ],
      )
    ];

    GlobalValues.widthLower = (width > 600);

    bool techVisible = false;
    bool techVisibleIcons = false;

    bool softVisible = false;
    bool softVisibleText = false;

    bool volunteerVisible = false;
    bool volunteerVisibleText = false;

    return SingleChildScrollView(
      child:  Container(
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
            Padding(padding: EdgeInsets.all(GlobalValues.widthLower ? width * 0.025 : width * 0.05),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'About me',
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

            SizedBox(height: height * 0.05),

            GlobalValues.widthLower
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listForDetails
            )
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listForDetails
            ),

            SizedBox(height: width * 0.05),

            VisibilityDetector(
              key: const Key('tech'), 
              onVisibilityChanged: (visible) async {
                if(visible.visibleFraction == 0){
                  techVisible = false;
                }
                else{
                  if(techVisible == false){
                    await _animationControllerTech.reverse();
                    _animationControllerTech.forward();
                    techVisible = true;
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _offsetLeftTech,
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.025),
                      child: Text('Technical skills', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.02 : width * 0.055, fontWeight: FontWeight.bold)),
                    )
                  ),
                  
                  SlideTransition(
                    position: _offsetRightTech,
                    child: Image.asset(
                      'assets/tech.png', 
                      height: GlobalValues.widthLower ? width * 0.05 : width * 0.1, 
                      width: GlobalValues.widthLower ? width * 0.05 : width * 0.1
                    )
                  )
                ],
              ), 
            ),

            VisibilityDetector(
              key: const Key('opacityTech'), 
              onVisibilityChanged: (visibile) async {

                if(visibile.visibleFraction == 0){
                  await _animationTechOpacity.reverse();
                  techVisibleIcons = false;
                }
                else{
                  if(techVisibleIcons == false){
                   await  _animationTechOpacity.forward();
                    techVisibleIcons = true;
                  }
                }
              },
              child: FadeTransition(
                opacity: _opacityTech,
                child: SizedBox(
                  width: width * 0.75,
                  child: GridView.count(
                    crossAxisCount: GlobalValues.widthLower ? 4 : 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SkillSquare(imageAssetPath: 'assets/java.png', label: 'Java', experience: 2),
                      SkillSquare(imageAssetPath: 'assets/c.png', label: 'C', experience: 4),
                      SkillSquare(imageAssetPath: 'assets/cplus.png', label: 'C++', experience: 4),
                      SkillSquare(imageAssetPath: 'assets/sql.png', label: 'SQL', experience: 2),
                      SkillSquare(imageAssetPath: 'assets/kotlin.png', label: 'Kotlin', experience: 2),
                      SkillSquare(imageAssetPath: 'assets/flutter.png', label: 'Flutter', experience: 2),
                      SkillSquare(imageAssetPath: 'assets/python.png', label: 'Python', experience: 1),
                      SkillSquare(imageAssetPath: 'assets/xml.png', label: 'XML', experience: 2),
                      SkillSquare(imageAssetPath: 'assets/asm.png', label: 'Assembly', experience: 2),
                      SkillSquare(imageAssetPath: 'assets/vhdl.png', label: 'VHDL', experience: 2),
                      SkillSquare(imageAssetPath: 'assets/arduino.png', label: 'Arduino', experience: 1),
                    ],
                  ),
                )
              )
            ),

            Padding(
              padding: EdgeInsets.all(width * 0.025),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: GlobalValues.widthLower ? Axis.horizontal : Axis.vertical,
                children: [
                  Visibility(
                    visible: GlobalValues.widthLower,
                    child: Text('> ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035))
                  ),
                  Text('All of the above were used in work that is found in section', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035), textAlign: TextAlign.center),
                  TextButton(onPressed: () {
                    widget.projectsOnTap();
                  }, child: Text('Projects', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035))),
                  Visibility(
                    visible: GlobalValues.widthLower,
                    child: Text('<', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035))
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.05),
            
            VisibilityDetector(
              key: const Key('soft'), 
              onVisibilityChanged: (visible) async {
                if(visible.visibleFraction == 0){
                  softVisible = false;
                }
                else{
                  if(softVisible == false){
                    await _animationControllerSoft.reverse();
                    _animationControllerSoft.forward();
                    softVisible = true;
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _offsetLeftSoft,
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.025),
                      child: Text('Soft skills', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.02 : width * 0.055, fontWeight: FontWeight.bold)),
                    )
                  ),
                  
                  SlideTransition(
                    position: _offsetRightSoft,
                    child: Image.asset(
                      'assets/soft.png', 
                      height: GlobalValues.widthLower ? width * 0.05 : width * 0.1, 
                      width: GlobalValues.widthLower ? width * 0.05 : width * 0.1
                    )
                  )
                ],
              ), 
            ),

            VisibilityDetector(
              key: const Key('opacitySoft'), 
              onVisibilityChanged: (visibile) async {

                if(visibile.visibleFraction == 0){
                  await _animationSoftOpacity.reverse();
                  softVisibleText = false;
                }
                else{
                  if(softVisibleText == false){
                   await  _animationSoftOpacity.forward();
                    softVisibleText = true;
                  }
                }
              },
              child: FadeTransition(
                opacity: _opacitySoft,
                child: SizedBox(
                  width: width * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(GlobalValues.widthLower ? width * 0 : width * 0.02),
                        child: Flex(
                          direction: GlobalValues.widthLower ? Axis.horizontal : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('> Communication: ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035, fontWeight: FontWeight.bold)),
                            Text('I find it very easy to have a conversation or to share a laugh with anyone', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035), textAlign: TextAlign.center)
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(GlobalValues.widthLower ? width * 0 : width * 0.02),
                        child: Flex(
                          direction: GlobalValues.widthLower ? Axis.horizontal : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('> Teamwork: ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035, fontWeight: FontWeight.bold)),
                            Text('For me this skill has proven to be the most effective', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035), textAlign: TextAlign.center)
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(GlobalValues.widthLower ? width * 0 : width * 0.02),
                        child: Flex(
                          direction: GlobalValues.widthLower ? Axis.horizontal : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('> Problem-Solving: ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035, fontWeight: FontWeight.bold)),
                            Text('> Funny, but i like problems and especially solving them', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035), textAlign: TextAlign.center)
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(GlobalValues.widthLower ? width * 0 : width * 0.02),
                        child: Flex(
                          direction: GlobalValues.widthLower ? Axis.horizontal : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('> Adaptability: ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035, fontWeight: FontWeight.bold)),
                            Text('> Flexible and able to adapt to new challenges and technologies', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035), textAlign: TextAlign.center)
                          ],
                        ),
                      )
                    ],
                  )
                )
              )
            ),

            SizedBox(height: height * 0.05),

            VisibilityDetector(
              key: const Key('volunteer'), 
              onVisibilityChanged: (visible) async {

                if(visible.visibleFraction == 0){
                  volunteerVisible = false;
                }
                else{
                  if(volunteerVisible == false){
                    await _animationControllerVolunteer.reverse();
                    _animationControllerVolunteer.forward();
                    volunteerVisible = true;
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _offsetLeftVolunteer,
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.025),
                      child: Text('Volunteering', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.02 : width * 0.055, fontWeight: FontWeight.bold)),
                    )
                  ),
                  
                  SlideTransition(
                    position: _offsetRightVolunteer,
                    child: Icon(Icons.volunteer_activism, size: GlobalValues.widthLower ? width * 0.05 : width * 0.08)
                  )
                ],
              ), 
            ),

            VisibilityDetector(
              key: const Key('opacityVolunteer'), 
              onVisibilityChanged: (visibile) async {

                if(visibile.visibleFraction == 0){
                  await _animationVolunteerOpacity.reverse();
                  volunteerVisibleText = false;
                }
                else{
                  if(volunteerVisibleText == false){
                   await  _animationVolunteerOpacity.forward();
                    volunteerVisibleText = true;
                  }
                }
              },
              child: FadeTransition(
                opacity: _opacityVolunteer,
                child: Container(
                  width: width * 0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('> I also did volunteering for this organizations: ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.035)),

                      Row(
                        children: [
                          Text('\tOSUT ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.011 : width * 0.03, fontWeight: FontWeight.bold)),
                          Text('Cluj-Napoca (2022 - 2023)', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.011 : width * 0.03)),
                        ],
                      ),

                      Row(
                        children: [
                          Text('\tAIESEC ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.011 : width * 0.03, fontWeight: FontWeight.bold)),
                          Text('Cluj-Napoca (2024)', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.011 : width * 0.03)),
                        ],
                      ),

                      Row(
                        children: [
                          Text('\tElectric Castle ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.011 : width * 0.03, fontWeight: FontWeight.bold)),
                          Text('(2024)', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.011 : width * 0.03))
                        ],
                      ),

                      Row(
                        children: [
                          Text('\tCentral Park Wine Festival ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.011 : width * 0.03, fontWeight: FontWeight.bold)),
                          Text('(2024)', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.011 : width * 0.03))
                        ],
                      )
                    ],
                  )
                )
              )
            ),

            SizedBox(height: height * 0.05),

            Padding(
              padding: EdgeInsets.all(width * 0.025),
              child: Flex(
                direction: GlobalValues.widthLower ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: GlobalValues.widthLower,
                    child: Text('> ', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.02 : width * 0.055, fontWeight: FontWeight.bold))
                  ),
                  Text('Here you can see my', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.02 : width * 0.055, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {

                    html.window.open('/assets/assets/updated-cv-english.pdf', 'CV');

                  }, child: Text('CV', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.02 : width * 0.055, fontWeight: FontWeight.bold, color: Colors.purple))),
                  Visibility(
                    visible: GlobalValues.widthLower,
                    child: Text(' <', style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.02 : width * 0.055, fontWeight: FontWeight.bold))
                  )
                ],
              )
            ),
          ],
        ) 
      ),
    );
  }
}