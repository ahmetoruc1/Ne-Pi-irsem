import 'package:flutter/material.dart';

import 'GonderiKarti.dart';

class ProfilKarti extends StatelessWidget {

  final String adsoyad;
  final String kullaniciadi;
  final String kapakresimLinki;
  final String profilresmiLinki;


  const ProfilKarti({Key? key, required this.adsoyad, required this.kullaniciadi,
    required this.kapakresimLinki, required this.profilresmiLinki }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 230.0,
                  //color: Colors.yellow,
                ),
                Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                      //color: Colors.green,
                      image: DecorationImage(
                          image: NetworkImage(
                              kapakresimLinki),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 0.0,
                  //Positioned Stack içindeki ögeyinin pozisyon almasa yarar
                  //left 20=soldan 20 piksel bırak,bottom 0 =alttan 0 piksel bıraktır
                  //positioned stack içindeki en büyük elemana göre hiza alır
                  child: Hero(
                    tag: kullaniciadi,
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(60.0),
                          border: Border.all(width: 2.0, color: Colors.white),
                          image: DecorationImage(
                              image: NetworkImage(
                                  profilresmiLinki),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  left: 145.0,
                  top: 190.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        adsoyad,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(kullaniciadi,
                          style: TextStyle(fontSize: 15.0, color: Colors.grey))
                    ],
                  ),
                ),
                Positioned(
                  top: 130.0,
                  right: 15.0,
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.grey.shade200,
                        border: Border.all(width: 2.0, color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_circle,
                          size: 18.0,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text("Takip Et",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context,true);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: 75.0,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  SosyalSayaclar("311","Takipçi"),
                  SosyalSayaclar("357","Takip"),
                  SosyalSayaclar("13","Gönderi"),
                ],
              ),
            ),
            GonderiKarti(
              //story kartından profil kartına geçilmesin gönderi kartının üzerindeki resim ve isim adından geçilsin
                profilresimLinki:
                "$profilresmiLinki",
                isimsoyad: "$adsoyad",
                gecenSure: "3 Hafta önce",
                aciklama: "#SaltBae",
                gonderiResimLinki:
                "$kapakresimLinki"),
          ],
        ));
  }

  Column SosyalSayaclar(String sayi,String yazi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(sayi,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 1.0),
        Text( yazi,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey.shade600 ,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}