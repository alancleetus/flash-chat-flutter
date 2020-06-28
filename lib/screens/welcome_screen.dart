import 'package:flash_chat/components/button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, //this property is required
      // upperBound: 100, //when using animation curves this value must be <=1
    );

    //animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);

    animation.addStatusListener((status) {
      print(status);
      //end of forward animation is called AnimationStatus.completed
      //end of reverse animation is called AnimationStatus.dismissed
    });

    controller.forward();
    controller.addListener(() {
      //print("Tick ${controller.value}");
      //print("Color ${animation.value}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  speed: Duration(milliseconds: 500),
                  repeatForever: true,
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            MyButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            MyButton(
              text: 'Register',
              color: Colors.blueAccent,
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
