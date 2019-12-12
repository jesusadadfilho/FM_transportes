import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fm_transportes_app/loginScreenPage.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScrennPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/second':
            return PageTransition(
              child: LoginScrennPage(),
              type: PageTransitionType.scale,
              settings: settings,
            );
            break;
          default:
            return null;
        }
      },
    );
  }
}

class SplashScrennPage extends StatefulWidget {
  SplashScrennPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SplashScrennState createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrennPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: LoginScrennPage(),
            duration: Duration(milliseconds: 1000)
        ),
      );
    });
//    PageTransition(type: PageTransitionType.rightToLeft, child: LoginScrennPage(), duration: Duration(seconds: 2));
//    Timer(Duration(seconds: 3), (){ Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, child: LoginScrennPage()));});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Image.asset("assets/logo.jpeg")],
              ),
            )
          ],
        )
      ],
    ));
  }
}
