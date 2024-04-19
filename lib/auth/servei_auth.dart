import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fer login
  Future<UserCredential> loginAmbEmailIPassword(String email, password) async {

    try {
      UserCredential credencialUsuari = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );

      _firestore.collection("Usuaris").doc(credencialUsuari.user!.uid).set({
        "uid": credencialUsuari.user!.uid,
        "email": email,
      });

      return credencialUsuari;

    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
    
  }

  // Fer registre
  Future<UserCredential> registreAmbEmailIPassword(String email, password) async {

    try {
      UserCredential credencialUsuari = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );

      _firestore.collection("Usuaris").doc(credencialUsuari.user!.uid).set({
        "uid": credencialUsuari.user!.uid,
        "email": email,
      });

      return credencialUsuari;

    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
    
  }

  Future<void> actualitzarNomUsuari(String nouNom) async {
  User? usuari = _auth.currentUser;
  if (usuari != null && nouNom.isNotEmpty) {
    await usuari.updateDisplayName(nouNom);
    await usuari.reload(); // Recargar la información del usuario para que los cambios tengan efecto inmediato

    // Actualizar el nombre en Firestore
    return _firestore.collection("Usuaris").doc(usuari.uid).update({
      "nom": nouNom,
    });
  }
}

  // Fer logout
  Future<void> tancarSessio() async {
    return await _auth.signOut();
  }

  User? getUsuariActual() {
    return _auth.currentUser;
  }
}