import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main()  async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //initialize etmeden ve main'i asenkeron yapmadan firebase e erişilemedi.

  runApp(Copy());

}

class Copy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(),
          body: Center(child: Text("Merhaba"))
      ),
    );
  }
}



final db=FirebaseFirestore.instance;