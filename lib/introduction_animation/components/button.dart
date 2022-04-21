import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CenterNextButton extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onNextClick;

  const CenterNextButton(
      {Key? key, required this.animationController, required this.onNextClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _topMoveAnimation =
    Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _signUpMoveAnimation =
    Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _loginTextMoveAnimation =
    Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return Padding(
      padding:
      EdgeInsets.only(bottom: 16 + MediaQuery
          .of(context)
          .padding
          .bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: _topMoveAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) =>
                  AnimatedOpacity(
                    opacity: animationController.value >= 0.2 && animationController.value <= 0.6 ? 1 : 0,
                    duration: Duration(milliseconds: 480),
                    /*child: _pageView(),*/
                  ),
            ),
          ),
          SlideTransition(
            position: _topMoveAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) =>
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 38 - (38 * _signUpMoveAnimation.value)),
                    child: Container(
                      height: 58,
                      width: 58 + (200 * _signUpMoveAnimation.value),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8 + 32 * (1 - _signUpMoveAnimation.value)),
                        color: Color(0xff000000),
                      ),
                      child: PageTransitionSwitcher(
                        duration: Duration(milliseconds: 480),
                        reverse: _signUpMoveAnimation.value < 0.7,
                        transitionBuilder: (Widget child,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,) {
                          return SharedAxisTransition(
                            fillColor: Colors.transparent,
                            child: child,
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.vertical,
                          );
                        },
                        child: _signUpMoveAnimation.value > 0.7 ? InkWell(
                          key: ValueKey('Sign Up button'),
                          onTap: onNextClick,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Start', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500
                                  ),
                                ),
                                Icon(Icons.arrow_forward_rounded, color: Colors.white),
                              ],
                            ),
                          ),
                        )
                            : InkWell(
                          key: ValueKey('next button'),
                          onTap: onNextClick,

                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SlideTransition(
              position: _loginTextMoveAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not have any account? ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'SignUp',
                    style: TextStyle(
                      color: Color(0xff132137),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
