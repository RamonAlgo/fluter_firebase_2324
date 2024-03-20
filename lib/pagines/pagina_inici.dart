import 'dart:js';

import 'package:fluter_firebase_2324/auth/servei_auth.dart';
import 'package:fluter_firebase_2324/chat/servei_chart.dart';
import 'package:fluter_firebase_2324/components/item_usuari.dart';
import 'package:fluter_firebase_2324/pagines/pagina_chat.dart';
import 'package:flutter/material.dart';

class PaginaInici extends StatelessWidget {
  PaginaInici({super.key});

  final ServeiAuth _serveiAuth = ServeiAuth();
  final Serveichat _serveiChat = Serveichat();


  void logout() {
    
    _serveiAuth.tancarSessio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pàgina inici"),
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: _construeixLlistaUsuaris(),
    );
  }
  Widget _construeixLlistaUsuaris(){
    
    return StreamBuilder(
      stream: _serveiChat.getUsuaris(), 
      builder: (context, snapshot) {
        
        // mirar si hi ha error.
        if (snapshot.hasError) {
          
          return const Text("Error");
        }
        
        // esperem que es carreguin les dades.
        if (snapshot.connectionState == ConnectionState.waiting) {
          
          return const Text("Carregant dades..");
        }
        // es retornen les dades.
         return ListView(
          children: snapshot.data!.map<Widget>(
            (dadesUsuari) => _construeixItemUsuari(dadesUsuari, context)
          ).toList(),
         );
      }
    );
  }
  Widget _construeixItemUsuari(Map<String, dynamic> dadesUsuari, BuildContext context) {

    if (dadesUsuari["email"] == _serveiAuth.getUsuarisActual()!.email) {
      return Container();
    }
    return ItemUsuari(
      emailUsuari: dadesUsuari["email"],
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaginaChat(
              emailAmbQuiParlem: dadesUsuari["email"],
              ), 
          )
        );
      },
    );
  }
}
