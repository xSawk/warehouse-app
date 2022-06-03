import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warehouse_app/page/home_page.dart';
import 'package:warehouse_app/screens/list.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => goBack(context),
          ),
        ),
        body: MyCustomForm(),
      ),
    );
  }

  void goBack(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ListProductsPage()),
      );
}

class MyCustomForm extends StatefulWidget {
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  TextEditingController nameControler = new TextEditingController();

  TextEditingController amountControler = new TextEditingController();

  String _data = "";

  scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.QR)
        .then((value) => setState(() => _data = value));
    nameControler.text = _data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.center,
          child: Text('Formularz dodawania',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  color: Colors.blue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            controller: nameControler,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Podaj nazwę produktu',
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            controller: amountControler,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Podaj ilość',
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shadowColor: Colors.blueAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              minimumSize: Size(120, 50),
            ),
            onPressed: () => add(),
            child: Text('Wyślij'),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.center,
          child: IconButton(
            icon: const Icon(Icons.qr_code_2_rounded),
            iconSize: 120,
            tooltip: 'Skanuj QR',
            onPressed: () {
              setState(
                () async => setState(() => _data = scan()),
              );
            },
          ),
        ),
      ],
    );
  }

  void clearText() {
    nameControler.clear();
    amountControler.clear();

    
  }

  Future<void> add() {
    final String fullName;
    final String amount;

    CollectionReference users =
        FirebaseFirestore.instance.collection('products');
    return users
        .add({
          'name': fullName = nameControler.text,
          'amount': amount = amountControler.text,
        })
        .then((value) => clearText())
        .catchError((error) => print("Failed to add user: $error"));
  }
}
