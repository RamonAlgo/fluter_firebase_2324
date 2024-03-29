import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter_firebase_2324/auth/login_o_registre.dart';
import 'package:fluter_firebase_2324/pagines/pagina_inici.dart';
import 'package:flutter/material.dart';

class PortalAuth extends StatelessWidget {
  const PortalAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return PaginaInici();
          }else{
            return const LoginORegistre();
          }
        },
      ),
    );
  }
}