import 'package:flutter/material.dart';
import 'package:light/light.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SensorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Light _light;
  String _luxString = 'unknown';
  late StreamSubscription _subscription;

  void onData(int luxValue) async {
    print("lux value: $luxValue");
    setState(() {
      _luxString = "$luxValue";
    });
  }

  void stopListening() {
    _subscription.cancel();
  }

  void startListening() {
    _light = new Light();
    try {
      _subscription = _light.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatFormState();
  }

  Future<void> initPlatFormState() async {
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    double nivel = double.tryParse('$_luxString') ?? 0.0;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.only(right: 100.0),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: new CircularPercentIndicator(
                      radius: 130.0,
                      lineWidth: 10.0,
                      percent: (nivel <= 999) ? nivel / 1000 : 0.0,
                      center: Container(
                        margin: EdgeInsets.only(top: 40.0),
                        padding: EdgeInsets.only(top: 10.0),
                        child: new Text(
                          "$_luxString\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40.0),
                        ),
                      ),
                      footer: new Text(
                        "\nLumen levels per M²(LUX)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                    text: '---------------------\n', style: TextStyle(height: 2,fontSize: 20, color: Colors.black)
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                    text:'20000-40000:   You should go to safe area!\n'
                        '10000-20000:   Please low the light screen!\n'
                        '1000-10000:     Now you are safe!\n'
                        '0-1000:              Please use dark mode!\n', style: TextStyle(height: 2,fontSize: 15, color: Colors.black)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:light/light.dart';
// import 'dart:async';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// class SensorHome extends StatelessWidget {
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     title: '',
//   //     home: HomePage(),
//   //   );
//   // }
//
//   late Light _light;
//   String _luxString = 'unknown';
//   late StreamSubscription _subscription;
//
//   void onData(int luxValue) async {
//     print("lux value: $luxValue");
//     setState(() {
//       _luxString = "$luxValue";
//     });
//   }
//
//   void stopListening() {
//     _subscription.cancel();
//   }
//
//   void startListening() {
//     _light = new Light();
//     try {
//       _subscription = _light.lightSensorStream.listen(onData);
//     } on LightException catch (exception) {
//       print(exception);
//     }
//   }
//
//   Future<void> initPlatFormState() async {
//     startListening();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double nivel = double.tryParse('$_luxString') ?? 0.0;
//     return Scaffold(
//       // resizeToAvoidBottomInset: false,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Stack(
//                     children: <Widget>[
//                       Container(
//                         height: 50,
//                         width: 50,
//                         padding: EdgeInsets.only(right: 100.0),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     color: Colors.transparent,
//                     child: new CircularPercentIndicator(
//                       radius: 130.0,
//                       lineWidth: 10.0,
//                       percent: (nivel <= 999) ? nivel / 1000 : 0.0,
//                       center: Container(
//                         margin: EdgeInsets.only(top: 40.0),
//                         padding: EdgeInsets.only(top: 10.0),
//                         child: new Text(
//                           "$_luxString\n",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 40.0),
//                         ),
//                       ),
//                       footer: new Text(
//                           "\n               Lumen levels per M²(LUX)\n\n"
//
//                             '20000-40000:   You should go to safe area!\n'
//                             '10000-20000:   Please low the light screen!\n'
//                             '1000-10000:     Now you are safe!\n'
//                             '0-1000:              Please use dark mode!\n',
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void setState(Null Function() param0) {}
// }