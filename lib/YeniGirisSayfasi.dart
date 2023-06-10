import 'package:flutter/material.dart';
import 'package:ne_pisirsem/hesapOlustur.dart';

class YeniGirisSayfasi extends StatefulWidget {
  const YeniGirisSayfasi({Key? key}) : super(key: key);

  @override
  State<YeniGirisSayfasi> createState() => _YeniGirisSayfasiState();
}

class _YeniGirisSayfasiState extends State<YeniGirisSayfasi> {

  final _formAnahtari=GlobalKey<FormState>();
  bool yukleniyor=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (body: Stack(
        children: [
          _sayfaElemanlari(context),
          _yuklemeAnimasyonu(),
        ],
      ));
  }

    _yuklemeAnimasyonu(){
    if(yukleniyor){
      return Center(child: CircularProgressIndicator());
    }
    else{
      return SizedBox(height: 0.0,);
    }
  }

  Widget _sayfaElemanlari(BuildContext context) {
    return Form(
    key: _formAnahtari,
      child: ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height:335.0,
          decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage("assets/Mainpage_Image.png"),
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: TextFormField(
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "E-mail Adresinizi Girin",
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder()
            ),
            validator: (girilenDeger){
              if(girilenDeger!.isEmpty){
                return "E-Mail alanı Boş Bırakılamaz";
              }else if(!girilenDeger.contains("@")){//girilen değerde @ sembolü kontrolü yapıldı.
                return "Girilen Değer Mail Formatında Olmalı";
              }
              else{
                return null;
              }
            },
          ),
        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Şifrenizi Girin",
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
          ),

        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: _hesapolustur,
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
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: InkWell(
                  onTap: _girisYap,
                  child: Container(

                    alignment: Alignment.center,
                    //width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text("Giriş Yap",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Center(child: Text("veya")),
        SizedBox(height: 20.0),
        /*Center(child: Text("Google İle Giriş Yap",
        style: TextStyle(fontSize: 19.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey))),*/
        Padding(
          padding: const EdgeInsets.only(left: 80.0,right: 80.0),
          child: Container(
            alignment: Alignment.center,
            width: 50.0,
            height: 40.0,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0,3),

              )],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(image:AssetImage("assets/google_icon.png"),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: Text("Google ile Devam et",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),),
          ),
        ),

        SizedBox(height: 20.0),
        Center(child: Text("Şifremi Unuttum")),
      ],
  ),
    );
  }

  void _girisYap(){
    if(_formAnahtari.currentState!.validate()){
      setState(() {
        yukleniyor=true;
      });
    }
  }
  Future _hesapolustur(){
    return Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HesapOlustur()));
  }
}
