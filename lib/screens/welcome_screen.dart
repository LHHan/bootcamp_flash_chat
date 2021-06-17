import 'package:bootcamp_flash_chat/screens/login_screen.dart';
import 'package:bootcamp_flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animationBackground;
  late Animation animationButtonLogin;
  late Animation animationButtonRegister;
  late Animation animationTextLogin;
  late Animation animationTextRegister;
  late Animation animationLogo;
  late Animation animationTitle;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animationBackground =
        ColorTween(begin: Colors.blue, end: Colors.white).animate(controller);

    animationButtonLogin =
        ColorTween(begin: Colors.white, end: Colors.lightBlueAccent)
            .animate(controller);

    animationButtonRegister =
        ColorTween(begin: Colors.white, end: Colors.blueAccent)
            .animate(controller);

    animationTextLogin =
        ColorTween(begin: Colors.lightBlueAccent, end: Colors.white)
            .animate(controller);

    animationTextRegister =
        ColorTween(begin: Colors.blueAccent, end: Colors.white)
            .animate(controller);

    animationLogo = Tween(begin: 0.0, end: 60.0).animate(controller);

    animationTitle = Tween(begin: 65.0, end: 45.0).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationBackground.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animationLogo.value,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: animationTitle.value,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: animationButtonLogin.value,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: animationTextLogin.value,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: animationButtonRegister.value,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: animationTextRegister.value,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
