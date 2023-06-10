import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ne_pisirsem/services/yetkilendirmeServisi.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class HesapOlustur extends StatefulWidget {
  const HesapOlustur({Key? key}) : super(key: key);

  @override
  State<HesapOlustur> createState() => _HesapOlusturState();
}

class _HesapOlusturState extends State<HesapOlustur> {
  final _formAnahtari=GlobalKey<FormState>();
  final _scaffoldAnahtari=GlobalKey<ScaffoldState>();
  bool yukleniyor=false;
   late String kullaniciAdi,email,sifre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldAnahtari,
      appBar: AppBar(
        title: Text("Hesap Oluştur"),

      ),
      body: ListView(
        children: [
          yukleniyor ? LinearProgressIndicator() : SizedBox(height: 0.0),
          SizedBox(height: 20.0,),
          Padding(

            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formAnahtari,
                child:
                Column(
              children: [

                TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                      hintText: "Kullanıcı Adınızı Giriniz",
                      labelText: "Kullanıcı Adı",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()
                  ),
                  validator: (girilenDeger){
                    if(girilenDeger!.isEmpty){
                      return "Kullanıcı Adı alanı Boş Bırakılamaz";
                    }
                    else if(girilenDeger.trim().length<4 || girilenDeger.trim().length>10){
                      return "Şifre en az 4 en fazla 10 karakter olabilir";
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (girilenDeger){
                    kullaniciAdi=girilenDeger!;
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "E-mail adresinizi Giriniz",
                      labelText: "Mail",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder()
                  ),
                  validator: (girilenDeger){
                    if(girilenDeger!.isEmpty){
                      return "E-mail alanı Boş Bırakılamaz";
                    }
                    else if(!girilenDeger.contains("@")){
                      return "Girilen Değer Mail Formatında Olmalı";
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (girilenDeger){
                    email=girilenDeger!;
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Şifrenizi Girin",
                      labelText: "Şifre",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder()
                  ),
                  validator: (girilenDeger){
                    if(girilenDeger!.isEmpty){
                      return "Şifre alanı Boş Bırakılamaz";
                    }
                    else if(girilenDeger.trim().length<6){
                      return "Şifre 6 Karakterden Az Olamaz";
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (girilenDeger){
                    sifre=girilenDeger!;
                  },
                ),
                SizedBox(height: 50.0,),
                GestureDetector(
                  onTap: _kullaniciOlustur,
                  child: Container(
                    alignment: Alignment.center,
                    //width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.shade600,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text("Hesap Oluştur",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                  ),
                ),
              ],
            )),
          ),



        ],
      ),
    );
  }

  void _kullaniciOlustur() async{
    var _formstate=_formAnahtari.currentState!;
    if(_formstate.validate()){
      _formstate.save();
      setState(() {
        yukleniyor=true;
      });
      try{
        await YetkilendirmeServisi().mailileKayit(email, sifre);
        Navigator.pop(context);
      } on FirebaseAuthException catch(hata){
        //print(hata);
        setState(() {
          yukleniyor=false;
        });
        uyariGoster(hataKodu:hata.code,context: context);
      }
    }
  }
}
uyariGoster({hataKodu, required BuildContext context}) {
  String hataMesaji = "hata";

  if (hataKodu == "invalid-email") {
    hataMesaji = "Girdiğiniz eposta adresi geçersizdir!";
  } else if (hataKodu == "email-already-in-use") {
    hataMesaji = "Girdiğiniz eposta adresi zaten kayıtlıdır!";
    print(hataMesaji);
  } else if (hataKodu == "weak-password") {
    hataMesaji = "Girilen şifre çok zayıf!";
  } else if (hataKodu == "operation-not-allowed") {
    hataMesaji = "İşlem onaylanmadı!";
  }

  var snackBar = SnackBar(
    content:Text(
      hataMesaji.toString(),
      style: TextStyle(color: Colors.white),
    ),
  );

  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
}



