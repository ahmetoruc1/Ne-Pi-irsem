import 'package:flutter/material.dart';
import 'package:ne_pisirsem/anasayfa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(

          body:GirisSayfasi()
      ),
    );
  }
}
class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //String kullaniciadi=


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ne Pişirsem'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
          children: <Widget>[
      Container(
      alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Giriş Yap',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 30),
          )
      ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(

                decoration: InputDecoration(
                    icon: Icon(
                        Icons.person
                    ),
                    hintText: "Kullanıcı Adı",
                    border: OutlineInputBorder(),



                ),
                controller: nameController,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child:TextField(
                obscureText: true,

                  decoration: InputDecoration(
                      icon: Icon(
                          Icons.lock
                      ),
                      hintText: "Şifre",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility),
              ),
              controller: passwordController,
            ),

            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 50.0,
              child: ElevatedButton(
                child: Text("Giriş Yap"),
                onPressed: (){
                  print(nameController.text);

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Anasayfa(
                      kullaniciadi:nameController.text)
                  ));
                },
              ),
            )
          ]
      ),
    );
  }

}