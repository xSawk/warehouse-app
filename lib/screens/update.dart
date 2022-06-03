import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProductsPage extends StatefulWidget {
  final String id;
  UpdateProductsPage({Key? key, required this.id}) : super(key: key);

  @override
  _UpdateProductsPageState createState() => _UpdateProductsPageState();
}

class _UpdateProductsPageState extends State<UpdateProductsPage> {
  final _formKey = GlobalKey<FormState>();

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> update(id, name, amount) {
    return products
        .doc(id)
        .update({'name': name, 'amount': amount})
        .then((value) => print("Product Updated"))
        .catchError((error) => print("Failed to update product: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Form(
          key: _formKey,
          // Getting Specific Data by ID
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('products')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var name = data!['name'];
              var amount = data['amount'];

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                      SizedBox(
                      height: 30,
                    ),
                          Align(
          alignment: Alignment.center,
          child: Text('Formularz aktualizacji',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  color: Colors.blue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
        ),
         SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: name,
                        autofocus: false,
                        onChanged: (value) => name = value,
                        decoration: InputDecoration(
                          labelText: 'Nazwa: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: amount,
                        autofocus: false,
                        onChanged: (value) => amount = value,
                        decoration: InputDecoration(
                          labelText: 'Ilość: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              shadowColor: Colors.blueAccent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              minimumSize: Size(120, 50),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                update(widget.id, name, amount);
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Wyślij'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
