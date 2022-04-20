import 'package:best_flutter_ui_templates/introduction_animation/components/eyecare.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/button.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/firstpage.dart';
import 'package:best_flutter_ui_templates/introduction_animation/components/welcome.dart';
import 'package:flutter/material.dart';
import '../sensor.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() => _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
            RelaxView(
              animationController: _animationController!,
            ),
            WelcomeView(
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onNextClick() {
    if (_animationController!.value > 0.6 && _animationController!.value <= 0.8) {
      _signUpClick();
    }
    _animationController?.animateTo(0.8, duration: Duration(milliseconds: 1200));
  }

  void _signUpClick() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) => Sensor()), (route) => false);
  }

}