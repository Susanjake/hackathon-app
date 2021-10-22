// ignore: unused_import
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto-Light',
      ),
      //to disable debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        child: LoginPage(),
      )),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  // ignore: unused_field
  var _backgroundColor = Colors.white;
  //adding a variable
  var _textColor = Colors.black;
  double _loginYOffset = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  double _registerYOffset = 0;
  @override
  Widget build(BuildContext context) {
    //type it in buildcontext
    windowHeight = MediaQuery.of(context).size.height;
    windowHeight = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _textColor = Colors.black;
        _loginYOffset = 1000;
        //initially was _logiYOffset = windowHeight
        _registerYOffset = 1000;

        break;
      case 1:
        _backgroundColor = Color(0xff98C6D9);
        _textColor = Colors.black87;
        _loginYOffset = 245;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Color(0xff98C6D9);

        _textColor = Colors.black;
        _loginYOffset = 245; // _loginYOffset =50;
        _registerYOffset = 50;
        break;
    }
    //main container
    return Stack(
      children: [
        AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000,
            ),
            color: _backgroundColor, //changemade
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 0;
                      });
                    },
                    child: Container(
                        child: Column(
                      children: [
                        Container(
                            //dpsc cont
                            margin: EdgeInsets.only(
                          top: 100,
                        )),
                        Text("App name",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: _textColor,
                            )),
                        SizedBox(height: 15),
                        Container(
                            margin: EdgeInsets.only(
                          top: 10,
                        )),
                        Text("You are one click away from change",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: _textColor)),
                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 50, 8, 10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child:
                          Center(child: Image.asset("assets/images/home.png")),
                    ),
                  ),
                  Container(
                      //button container
                      //buttoncontaineris wrapped in a widget
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    //button widget
                    child: Container(
                      margin: EdgeInsets.all(32.0),
                      width: 2000,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Color(0xff98C6D9),
                      ),
                      child: Center(
                          child: Text("Get started",
                              style: TextStyle(
                                fontSize: 21,
                              ))),
                    ),
                  ))
                ])),
        //login page container
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 2;
            });
          },
          child: AnimatedContainer(
            curve: Curves.decelerate,
            duration: Duration(milliseconds: 10),
            transform: Matrix4.translationValues(0, _loginYOffset, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(65),
              ),
            ),
          ),
        ),

        //register page

        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 1;
            });
          },
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 100),
            transform: Matrix4.translationValues(0, _registerYOffset, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(65),
                topRight: Radius.circular(65),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
