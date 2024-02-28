import 'package:firebase_core/firebase_core.dart';
import 'package:fluter_firebase_2324/firebase_options.dart';
import 'package:fluter_firebase_2324/pagines/pagina_login.dart';
import 'package:fluter_firebase_2324/pagines/pagina_registre.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PaginaRegistre(),
      ),
    );
  }
}

/*
1) Tenir el Node.js instal·lat.
2) mpm install -g firebase-tools
3) Fer login a Firebase: firebase login
    - Si dona error de l'arxiu firebase.ps1, canviar-li el nom (o esborrar-lo i tornar a fer login).
    - Si tornem a fer firebase login, ens diu en quin compte estem.
    - Si vulguèssim canviar el compte, fem firebase logout.
4) Fer: dart pub global acrtivate flutterfire_cli
5) Vincular projecte local amb projecte Firebase de la Consola.
    - flutterfire configure
6) Incloure les llibreries de Firebase que vulguem utilitzar
    - flutter pub add firebase_auth
*/