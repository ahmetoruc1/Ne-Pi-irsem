import 'package:firebase_auth/firebase_auth.dart';

import '../models/kullanici.dart';

class YetkilendirmeServisi{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  Kullanici? _kullaniciolustur(User? firebaseKullanici){
    return firebaseKullanici==null ? null : Kullanici.firebasedenuret(firebaseKullanici);
  }

  Stream<Kullanici?> get durumTakipcisi{
    return _firebaseAuth.authStateChanges().map((_kullaniciolustur));
  }

  Future<Kullanici?>mailileKayit  (String email,String sifre) async {
    var girisKarti = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: sifre);
    return _kullaniciolustur(girisKarti.user);
  }

   Future<Kullanici?>mailileGiris  (String email,String sifre) async{
     var girisKarti =  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: sifre);
     return _kullaniciolustur(girisKarti.user);
   }

  Future<void>cikisYap(){
    return _firebaseAuth.signOut();
  }

}