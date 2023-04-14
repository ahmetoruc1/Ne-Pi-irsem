import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ne_pisirsem/LoginScreen.dart';
import 'package:ne_pisirsem/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BaslangicSayfasi()
    );
  }
}


class BaslangicSayfasi extends StatelessWidget {
  const BaslangicSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(138, 71, 235,100),
      body:Center(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height:335.0,
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage("assets/Mainpage_Image.png"),
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SizedBox(height: 12),
            Material(
              elevation: 9.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 270.0,
                width: MediaQuery.of(context).size.width-70.0,
                //margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    //color:Color(0xff8A47EB),
                  gradient: LinearGradient(colors: [Colors.deepPurple.shade600,
                  Colors.deepPurple.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  )
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Mail İle Kayıt Ol",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      ),
                    ),


                    Text("veya Sosyal Medyadan Kaydolun",
                    style: TextStyle(
                      color:Colors.white,
                    ),),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(image:AssetImage("assets/google_icon.png"),
                        alignment: Alignment.centerLeft,
                      ),
                        ),
                        child: Text("Google ile Devam et",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(image:AssetImage("assets/facebook_icon.png"),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        child: Text("Facebook ile Devam et",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Zaten bir hesabın var mı?",
                          style: TextStyle(fontSize: 16.0),
                          children: <TextSpan>[
                            TextSpan(text: " Giriş Yap",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                            ..onTap=(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>GirisSayfasi()));
                            })
                          ]
                        ),
                      )
                    ),
                  ],
                ),

              ),
            )
          ],
        ),
      )
    );
  }
}
