import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    // animation = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    // controller.reverse(from: 1.0);
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   } else if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   }
    // });
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    // controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [TypewriterAnimatedText('Flash Chat')],
                ),
              ],
            ),
            const SizedBox(height: 48.0),
            RoundedButton(
              onPressed: () {
                //Go to Login screen.
                setState(() {
                  Navigator.pushNamed(context, LoginScreen.id);
                });
              },
              text: 'Log In',
              color: Colors.lightBlueAccent,
            ),
            RoundedButton(
              onPressed: () {
                //Go to registration screen.
                setState(() {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                });
              },
              text: 'Register',
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
