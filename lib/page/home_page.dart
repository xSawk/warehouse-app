import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warehouse_app/screens/add.dart';

import 'package:warehouse_app/screens/list.dart';

import '../main.dart';
import 'onboarding_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => goBack(context),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.blue,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text('Aplikacja magazynowa',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 80,
                onPressed: () => goToList(context),
                color: Colors.amber[900],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text('Zarządzanie',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ],
                ),
                textColor: Colors.white,
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/test.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void goBack(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingPage()),
      );

  void goToAdd(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => AddProduct()),
      );

  void goToList(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ListProductsPage()),
      );
}
