import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Kullanici{
  final String id;
  final String isim;
  final String soyad;
  final String eposta;
  final String avatar;

  Kullanici({required this.isim, required this.id, required this.soyad, required this.eposta, required this.avatar});

  factory  Kullanici.dokumandanuret(DocumentSnapshot doc){
    //var temp =doc.data();

    return Kullanici(
        id: doc.id,
        isim: doc["isim"],
        soyad: doc["soyad"],
        eposta: doc["mail"],
        avatar: doc["avatar"]
    );
  }

  factory  Kullanici.firebasedenuret(User kullanici ){
    //var temp =doc.data();

    return Kullanici(
        id: kullanici.uid,
        isim: kullanici.displayName.toString(),
        eposta: kullanici.email.toString(),
        avatar: kullanici.photoURL.toString(),
        soyad: ''
    );
  }


}
