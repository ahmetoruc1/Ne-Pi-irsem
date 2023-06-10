import 'package:flutter/material.dart';
import 'package:ne_pisirsem/LoginScreen.dart';
import 'package:ne_pisirsem/anasayfa.dart';
import 'package:ne_pisirsem/main.dart';
import 'package:ne_pisirsem/models/kullanici.dart';
import 'package:ne_pisirsem/services/yetkilendirmeServisi.dart';

class Yonlendirme extends StatelessWidget {
  const Yonlendirme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: YetkilendirmeServisi().durumTakipcisi,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }

          if(snapshot.hasData){
            Kullanici? aktifKullanici=snapshot.data;
            return Anasayfa();
          }
          else{
            return BaslangicSayfasi();
          }
        });
  }
}
