import 'package:flutter/material.dart';
import 'GonderiKarti.dart';
import 'ProfilKarti.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';






class Anasayfa extends StatefulWidget {
  //final String kullaniciadi;

  const Anasayfa( {Key? key,   }) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

//final db =FirebaseFirestore.instance;
class _AnasayfaState extends State<Anasayfa> {
/*
  Future <void> kullanicilarigetir () async {
    var snapshot= await db.collection("kullanıcılar").get();
    snapshot.docs.forEach((doc) {
      print(doc.data());

    });
  }

  @override
  void initState() {
    super.initState();
    kullanicilarigetir();
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 32.0,
              color: Colors.grey,
            ),
            onPressed: () {}),
        title: Text(
          "Ne Pişirsem",
          style: TextStyle(fontSize: 25.0, color: Colors.grey),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                size: 32.0,
                color: Colors.purple,
              ),
              onPressed: () {
                showModalBottomSheet(context: context, builder: (BuildContext context){
                  return Column(
                    children:<Widget> [
                      duyuru("Nusret seni takip etti ","2 Hafta önce"),
                      duyuru("Köfteci Yusuf bir gönderi yayınladı","3 Hafta önce"),
                      duyuru("CZN Burak gönderini beğendi","2 Hafta önce"),

                    ],
                  );
                });
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 3.0),
                blurRadius: 5.0,
              )
            ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              //story kartlarını sağa doğru kaydırmak için kaydırma yönü belirledim
              children: <Widget>[
                StoryKarti(
                    "",
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                    "",
                    ""),
                StoryKarti(
                    "Nusret",
                    "https://admin.biyografya.com/_docs/photos/87ab1d9d332c146e8184ab01e5579288.jpg",
                    "Nusret Gökçe",
                    "https://www.paraanaliz.com/wp-content/uploads/2022/08/nusret.jpg"),
                StoryKarti(
                    "Köfteci Yusuf",
                    "https://img.piri.net/resim/imagecrop/2021/05/21/02/29/resized_4bb8e-82a4fbbfyusufakkasdekupe.jpg",
                    "Yusuf Akkaş",
                    "https://garajkayseri.com/wp-content/uploads/2022/05/kofteci-yusuf-fiyat-780x400.jpg"),
                StoryKarti(
                    "CZN Burak",
                    "https://www.nobetcigazete.com/images/haberler/2022/10/czn-burak-aylik-gelirini-acikladi-6604.webp",
                    "Burak Özdemir",
                    "https://media.suara.com/pictures/653x366/2022/05/10/69529-chef-czn-burak-dan-lionel-messi.webp"),
                StoryKarti(
                    "Danilo",
                    "https://admin.biyografya.com/_docs/photos/c94461af06af879e2f991fd64826f242.jpg",
                    "Danilo Zanna",
                    "https://acunmedyaakademi.com/wp-content/uploads/2021/11/Untitled-3.png.webp"),
                StoryKarti(
                    "Refika Birgül",
                    "https://refikaninmutfagi.com/wp-content/uploads/2018/02/kitap-1-e1519634011106.jpg",
                    "Refika Birgül",
                    "https://iaftm.tmgrup.com.tr/871b4a/0/0/0/0/728/546?u=https://iftm.tmgrup.com.tr/2019/03/17/1552813997366.jpg"),
                StoryKarti(
                    "Arda Türkmen",
                    "https://imgrosetta.mynet.com.tr/file/13337213/13337213-728xauto.jpg",
                    "Arda Türkmen",
                    "https://i2.milimaj.com/i/milliyet/75/750x0/60c779fd86b2440088ca0918.jpg"),
              ],
            ),
          ),
          SizedBox(
            height: 10.00,
          ),
          GonderiKarti(
              profilresimLinki:
              "https://admin.biyografya.com/_docs/photos/87ab1d9d332c146e8184ab01e5579288.jpg",
              isimsoyad: "Nusret Gökçe",
              gecenSure: "3 Hafta önce",
              aciklama: "#SaltBae",
              gonderiResimLinki:
              "https://cdn.karar.com/news/1357282.jpg"),
          GonderiKarti(
              profilresimLinki:
              "https://img.piri.net/resim/imagecrop/2021/05/21/02/29/resized_4bb8e-82a4fbbfyusufakkasdekupe.jpg",
              isimsoyad: "Köfteci Yusuf",
              gecenSure: "1 Ay önce",
              aciklama: "#Hayırlı Ramazanlar",
              gonderiResimLinki:
              "https://www.bursahaberdar.com/images/upload/kof.jpg"),
          GonderiKarti(
              profilresimLinki:
              "https://www.nobetcigazete.com/images/haberler/2022/10/czn-burak-aylik-gelirini-acikladi-6604.webp",
              isimsoyad: "CZN Burak",
              gecenSure: "3 Gün önce",
              aciklama: "#İmparator",
              gonderiResimLinki:
              "https://cdn.yenicaggazetesi.com.tr/news/2023/02/20220230942362472681.jpeg"),
          GonderiKarti(
              profilresimLinki:
              "https://admin.biyografya.com/_docs/photos/c94461af06af879e2f991fd64826f242.jpg",
              isimsoyad: "Danilo Zanna",
              gecenSure: "1 Hafta önce",
              aciklama: "Afiyed Olsun Abijim",
              gonderiResimLinki:
              "https://iasbh.tmgrup.com.tr/94217a/752/395/0/0/1200/630?u=https://isbh.tmgrup.com.tr/sbh/2020/04/30/danilo-zanna-kimdir-masterchefle-taninan-danilo-zanna-kac-yasinda-nereli-1588202466639.jpg"),
          GonderiKarti(
              profilresimLinki:
              "https://refikaninmutfagi.com/wp-content/uploads/2018/02/kitap-1-e1519634011106.jpg",
              isimsoyad: "Refika Birbül",
              gecenSure: "1 Saat önce",
              aciklama: "Tarladan Tabaklara",
              gonderiResimLinki:
              "https://ilkhaber-gazetesicom.teimg.com/crop/1280x720/ilkhaber-gazetesi-com/uploads/2023/01/agency/aa/superfreshin-tarladan-tabaklara-uzanan-yolculugu-unlu-sef-refika-birgul-ile-yayinda.jpg"),
          GonderiKarti(
              profilresimLinki:
              "https://imgrosetta.mynet.com.tr/file/13337213/13337213-728xauto.jpg",
              isimsoyad: "Arda Türkmen",
              gecenSure: "5 Saat önce",
              aciklama: "Miss Gibi İftar Menüsü",
              gonderiResimLinki:
              "https://www.nereli.org/img/tv-programcisi/arda-turkmen-1.jpg"),

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: null,
          backgroundColor: Colors.purple.shade300,
          child: Icon(Icons.add_a_photo,color: Colors.white,)),
    );
  }

  Padding duyuru(String mesaj, String sure) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(mesaj,
            style: TextStyle(
                fontSize: 15.0
            ),),
          Text(sure,style: TextStyle(
              fontSize: 15.0),),
        ],
      ),
    );
  }

  //Not: Story kartından Profilkatı ekranına geçişi iptal et orada sadece story kalsın
//Profil kartı kodlarını tekrar yazmak yerine fonksiyonda tanımladık
  Widget StoryKarti(String kullanciadi, String resimlinki, String adsoyad,
      String kapakresimLinki) {
    //widget döndürmemizin sebebi padding eklenince story kartini ya padding döndürmesi için değiştirecektim ya da
    //widget diyip her türlü widget nesnesini kabul edecekti
    return Material(
      child: InkWell(
        onTap: () async {
          bool donenveri = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProfilKarti(
                    profilresmiLinki: resimlinki,
                    kullaniciadi: kullanciadi,
                    adsoyad: adsoyad,
                    kapakresimLinki: kapakresimLinki,
                  )));
          if(donenveri) {
            print("Kullanıcı Anasayfaya döndü.");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(//widgetları üst üste eklmeke için kullandım
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: kullanciadi,
                    // tag'e kullanıcı adı vermemizin sebebi aynı tagle birden fazla hero çalışmadaığından dolayıdır
                    //aynı şekilde eğer birden fazla aynı kullanıcı adı olurursa program hata verir
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                            image: NetworkImage(resimlinki),
                            fit: BoxFit.cover,
                            //resmin çerçeveye tam oturması için
                          )),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                kullanciadi,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

