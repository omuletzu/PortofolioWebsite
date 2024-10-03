import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portofolio_website/GlobalValues.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Offset> _offsetLeft;
  late Animation<Offset> _offsetBT;
  late Animation<Offset> _offsetRight;
  late Animation<double> _opacity;

  late AnimationController _animationControllerImage;
  late Animation<double> _offsetImage;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _offsetBT = Tween<Offset>(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _offsetLeft = Tween<Offset>(begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _offsetRight = Tween<Offset>(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _opacity = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();

    _animationControllerImage = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _offsetImage = Tween<double>(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(parent: _animationControllerImage, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerImage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    GlobalValues.widthLower = (width > 600);

    List<Widget> listOfContent = [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Hello, I am\n',
          style: GoogleFonts.courierPrime(
            textStyle: TextStyle(
              fontSize: GlobalValues.widthLower ? width * 0.025 : width * 0.075,
            ),
          ),
          children: <TextSpan>[
            TextSpan(
              text: '</Simota Mihnea>',
              style: GoogleFonts.courierPrime(
                textStyle: TextStyle(
                  fontSize: GlobalValues.widthLower ? width * 0.023 : width * 0.08,
                  color: const Color.fromARGB(255, 178, 2, 222),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: width * 0.05, height: width * 0.05),
      AnimatedBuilder(
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
      SizedBox(width: width * 0.05, height: width * 0.05),
      AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'Full Stack Developer',
            speed: const Duration(milliseconds: 250),
            textStyle: GoogleFonts.courierPrime(
              fontSize: GlobalValues.widthLower ? width * 0.02 : width * 0.055,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        totalRepeatCount: 1,
      )
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(222, 230, 232, 0.943),
            Colors.white,
            Color.fromRGBO(222, 230, 232, 0.943),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlobalValues.widthLower 
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listOfContent
            )
          : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listOfContent
          ),
          SizedBox(height: width * 0.05),
          Text(
            'Student at Technical University of Cluj-Napoca\n> Computer Science - Year 3 <',
            style: GoogleFonts.courierPrime(fontSize: GlobalValues.widthLower ? width * 0.015 : width * 0.03),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: width * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _offsetLeft,
                child: FadeTransition(
                  opacity: _opacity,
                  child: IconButton(
                    onPressed: () async {
                      final Uri url = Uri.parse('https://github.com/omuletzu?tab=repositories');
                      if (!await launchUrl(url)) {
                        throw Exception('Couldn\'t launch url');
                      }
                    },
                    icon: Image.asset(
                      'assets/github.png',
                      width: GlobalValues.widthLower ? width * 0.02 : width * 0.1,
                      height: GlobalValues.widthLower ? width * 0.025 : width * 0.15,
                      color: const Color.fromARGB(255, 46, 41, 48),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.05),
              SlideTransition(
                position: _offsetBT,
                child: FadeTransition(
                  opacity: _opacity,
                  child: IconButton(
                    onPressed: () async {
                      final Uri url = Uri.parse('https://www.linkedin.com/in/mihnea-simota-155829213/');
                      if (!await launchUrl(url)) {
                        throw Exception('Couldn\'t launch url');
                      }
                    },
                    icon: Image.asset(
                      'assets/linkdn.png',
                      width: GlobalValues.widthLower ? width * 0.02 : width * 0.1,
                      height: GlobalValues.widthLower ? width * 0.025 : width * 0.15,
                      color: const Color.fromARGB(255, 46, 41, 48),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.05),
              SlideTransition(
                position: _offsetRight,
                child: FadeTransition(
                  opacity: _opacity,
                  child: IconButton(
                    onPressed: () async {
                      final Uri url = Uri.parse('https://discordapp.com/users/490189803833524254');
                      if (!await launchUrl(url)) {
                        throw Exception('Couldn\'t launch url');
                      }
                    },
                    icon: Image.asset(
                      'assets/discord.png',
                      width: GlobalValues.widthLower ? width * 0.02 : width * 0.1,
                      height: GlobalValues.widthLower ? width * 0.025 : width * 0.15,
                      color: const Color.fromARGB(255, 46, 41, 48),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
