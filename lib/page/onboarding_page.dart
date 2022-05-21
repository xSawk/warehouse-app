import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:warehouse_app/screens/add.dart';
import 'package:warehouse_app/page/home_page.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: 'Aplikacja magazynowa',
                body: '',
                image: buildImage('assets/warehouse.png'),
                decoration: getPageDecoration1()),
            PageViewModel(
                title: 'Zarządzaj produktami',
                body: '',
                image: buildImage('assets/product.png'),
                decoration: getPageDecoration2()),
            PageViewModel(
                title: 'Skanuj produkty',
                body: '',
                image: buildImage('assets/qrcode.png'),
                decoration: getPageDecoration2()),
          ],
          done: Text('Gotowy', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Dalej'),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward),
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  PageDecoration getPageDecoration1() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
      );
  PageDecoration getPageDecoration2() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.fromLTRB(35, 35, 20, 0),
      );
}
