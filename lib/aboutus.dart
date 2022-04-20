import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: RichText(
                  text: TextSpan(
                    text: 'Rachata Chopdamrongtham', style: TextStyle(height: 2, fontSize: 20, color: Colors.orangeAccent)
                  ),
                ),
              ),
              Image(
                  height: 200,
                  width: 200,
                  image: AssetImage('assets/aboutus/rachata.png')
              ),
              Container(
                child: RichText(
                  text: TextSpan(
                      text: 'Varit Rungbanapan', style: TextStyle(height: 2, fontSize: 20, color: Colors.orangeAccent)
                  ),
                ),
              ),
              Image(
                  height: 200,
                  width: 200,
                  image: AssetImage('assets/aboutus/varit.png')
              )
            ],
          )
        )
      )
    );
  }