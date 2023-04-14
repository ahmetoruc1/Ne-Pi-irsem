import 'package:flutter/material.dart';
import 'package:ne_pisirsem/anasayfa.dart';

void main() => runApp(YemekTarifleri());

class YemekTarifleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Tarifler()
    );
  }
}
class Tarifler extends StatefulWidget {
  const Tarifler({Key? key}) : super(key: key);

  @override
  State<Tarifler> createState() => _TariflerState();
}

class _TariflerState extends State<Tarifler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: <Widget>[

          Center(
            child: Column(

              children: <Widget>[
                Stack(
                  children:<Widget>[
                    Container(

                      width: MediaQuery.of(context).size.width,
                      height:300.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage("https://i.nefisyemektarifleri.com/2023/04/12/somelek-kofte-12.jpg"),
                              alignment: Alignment.topCenter,
                              fit: BoxFit.cover)
                      ),

                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Anasayfa( kullaniciadi: '',)));
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                    )
                  ]
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    SizedBox(width: 20.0,),
                    Yemekismi("Sömelek Köfte"),
                  ],
                ),
                SizedBox(height: 4.0,),
                YemekBilgi(
                  "2-4 kişilik",
                "15 dk Hazırlık",
                  "10 dk Pişirme"

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          Text("Malzemeler",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff411F01)


                            ),
                            textAlign: TextAlign.left,),
                        ],
                      ),
                      SizedBox(height: 4.0),
                      Malzemeler("200 gr kıyma"),
                      Malzemeler("1 su bardağı köftelik bulgur"),
                      Malzemeler("1 su bardağı sıcak su (200 ml – bulguru ıslatmak için)"),
                      Malzemeler("Yarım su bardağı irmik"),
                      Malzemeler("2 yemek kaşığı un"),
                      Malzemeler("1 adet yumurta"),
                      Malzemeler("1 tatlı kaşığı acı biber salçası"),
                      Malzemeler("1 tatlı kaşığı tuz"),
                      Malzemeler("Yarım çay kaşığı karabiber"),
                      Malzemeler("Yarım çay kaşığı kimyon"),
                      SizedBox(height: 16.0),
                      Row(
                        children: [

                          Text("Sosu için",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff411F01)


                            ),
                            textAlign: TextAlign.left,),
                        ],
                      ),
                      SizedBox(height: 4.0),
                      Malzemeler("2 yemek kaşığı tereyağı"),
                      Malzemeler("1 yemek kaşığı domates salçası"),
                      Malzemeler("1 çay kaşığı tuz"),
                      Malzemeler("1 tatlı kaşığı kuru nane"),
                      SizedBox(height: 16.0),
                      Row(
                        children: [

                          Text("Yapılışı",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff411F01)


                            ),
                            textAlign: TextAlign.left,),
                        ],
                      ),
                      Yapilis("Uygun bir kap içerisine köftelik bulguru alalım."),
                      SizedBox(height: 8.0),
                      Yapilis("Üzerine sıcak suyu ilave edelim ve üzerini streçleyerek 10 – 15 dakika bekletelim."),
                      SizedBox(height: 8.0),
                      Yapilis("Sürenin sonunda suyunu çekip şişen bulgurun üzerine kıyma, irmik, yumurta, un, tuz, karabiber, kimyon ve biber salçasını ekleyerek elimizle yoğuralım."),
                      SizedBox(height: 8.0),
                      Yapilis("Hazır olan köfte harcından parçalar kopartalım ve avuç içerisinde yuvarlayarak yaklaşık serçe parmağımız boyutunda şekillendirelim."),
                      SizedBox(height: 8.0),
                      Yapilis("Köfteleri haşlamak için tencereye aldığımız suya limon tuzunu ekleyerek karıştıralım ve suyu kaynamaya bırakalım."),
                      SizedBox(height: 8.0),
                      Yapilis("Kaynayan suya köfteleri bırakalım ve 6-7 dakika kadar haşlayalım."),
                      SizedBox(height: 8.0),
                      Yapilis("Köfteler haşlanırken sosu için tavaya tereyağını alarak eritelim."),
                      SizedBox(height: 8.0),
                      Yapilis("Üzerine salça, tuz ve naneyi ekleyerek karıştıralım ve kavuralım."),
                      SizedBox(height: 8.0),
                      Yapilis("Haşlanan köftelerimizin suyunu süzerek sosun içerisine alalım. Nazikçe karıştırarak sosa bulanmasını sağlayalım."),
                      SizedBox(height: 8.0),
                      Yapilis("Sosunu çeken köftelerimizi servis tabağına alalım. Üzerine çırpılmış sarımsaklı ya da sarımsaksız yoğurt gezdirerek servis edelim. Afiyet olsun!"),




                    ],
                  ),
                ),
              ],
            ),
          ),

        ]

      ),
    );
  }

  Row Yapilis(String yapilis) {
    return Row(
      children: [
        Icon(Icons.label_important_sharp),
        Expanded(// Taşan metni bir alt satıra aldı
          child: Text(
            yapilis,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
  
  Row Malzemeler(String malzeme) {
    return Row(
                      children: [
                        Icon(Icons.playlist_add_check_outlined),
                        Expanded(
                          child: Text(
                              malzeme,
                          textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    );
  }

  Row YemekBilgi(String kisisayisi,String hazirlik, String pisirme) {
    return Row(
                children: <Widget>[
                  Icon(Icons.food_bank),
                  Text(kisisayisi),
                  Text(" | "),
                  Icon(Icons.access_time_filled),
                  Text("$hazirlik, $pisirme")
                ],
              );
  }

  Text Yemekismi(String yemekadi) {
    return Text(yemekadi,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff411F01)


                    ),
                  textAlign: TextAlign.left,);
  }
}

