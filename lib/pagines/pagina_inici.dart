import 'package:fluter_firebase_2324/auth/servei_auth.dart';
import 'package:fluter_firebase_2324/chat/servei_chart.dart';
import 'package:fluter_firebase_2324/components/item_usuari.dart';
import 'package:fluter_firebase_2324/pagines/editar_dades_usuari.dart';
import 'package:fluter_firebase_2324/pagines/pagina_chat.dart';
import 'package:flutter/material.dart';

class PaginaInici extends StatelessWidget {
  PaginaInici({super.key});

  final ServeiAuth _serveiAuth = ServeiAuth();
  final ServeiChat _serveiChat = ServeiChat();

  void logout() {
    //final serveiAuth = ServeiAuth();

    _serveiAuth.tancarSessio();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pàgina inici"),
        actions: [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditarDadesUsuari()));}, icon: Icon(Icons.person)),
          IconButton(
            onPressed: logout, 
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: _construeixLlistaUsuaris(),
    );
  }

  Widget _construeixLlistaUsuaris() {

    return StreamBuilder(
      stream: _serveiChat.getUsuaris(), 
      builder: (context, snapshot) {

        // Mirar si hi ha errror.
        if (snapshot.hasError) {

          return const Text("Error");
        }

        // Esperem que es carreguin les dades.
        if (snapshot.connectionState == ConnectionState.waiting) {

          return const Text("Carregant dades...");
        }

        // Es retornen les dades.
        return ListView(
          children: snapshot.data!.map<Widget>(
            (dadesUsuari) => _construeixItemUsuari(dadesUsuari, context)
          ).toList(),
        );
      },
    );
  }

  Widget _construeixItemUsuari(Map<String, dynamic> dadesUsuari, BuildContext context) {
  // Evitar mostrar el usuario actual en la lista
  if (dadesUsuari["email"] == _serveiAuth.getUsuariActual()!.email) {
    return Container();
  }

  // Utilizar el nombre si está disponible, de lo contrario usar el email
  String displayName = dadesUsuari["nom"]?.isEmpty ?? true ? dadesUsuari["email"] : dadesUsuari["nom"];

  return ItemUsuari(
    emailUsuari: displayName, // Mostrar nombre o email según lo que esté disponible
    onTap: () {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => PaginaChat(
            emailAmbQuiParlem: dadesUsuari["nom"] != null && dadesUsuari["nom"].isNotEmpty ? dadesUsuari["nom"] : dadesUsuari["email"], // Envía el nombre si está disponible, de lo contrario el email
            idReceptor: dadesUsuari["uid"],
          ),
        ),
      );
    },
  );
  }
}