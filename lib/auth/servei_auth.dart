import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//Fer Login

  Future<UserCredential> loginAmbEmailIPassword(String email, password) async {
    print(password);

    try{ 
      
      UserCredential creadencialUsuari = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
        );

        return creadencialUsuari;
   
  } on FirebaseAuthException catch (e){

    throw Exception(e);
  }

//Fer Registre

//Fer logout
  }
  }