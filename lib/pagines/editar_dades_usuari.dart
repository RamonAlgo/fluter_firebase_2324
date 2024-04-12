import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluter_firebase_2324/auth/servei_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditarDadesUsuari extends StatefulWidget {
  const EditarDadesUsuari({super.key});

  @override
  State<EditarDadesUsuari> createState() => _EditarDadesUsuariState();
}

class _EditarDadesUsuariState extends State<EditarDadesUsuari> {

  File? _imatgeSeleccionadaApp;
  Uint8List? _imatgeSeleccionadaWeb;
  bool _imatgeAPuntPerPujar = false;

Future<void> _triaImatge() async {

  final ImagePicker picker = ImagePicker();
  XFile? imatge = await picker.pickImage(source: ImageSource.gallery);

    if (imatge != null) {

      if (!kIsWeb) {
        
        File arxiuSeleccionat = File(imatge.path);

        setState(() {
          _imatgeSeleccionadaApp = arxiuSeleccionat;
          _imatgeAPuntPerPujar = true;
        });
      }  

      if (kIsWeb) {
        Uint8List arxiuEnBytes = await imatge.readAsBytes();


        setState(() {
          _imatgeSeleccionadaWeb = arxiuEnBytes;
          _imatgeAPuntPerPujar = true;
        });
      }
    }

}

  Future<bool> pujarImargePerUsuari() async {

    String idUsuari = ServeiAuth().getUsuariActual()!.uid;


    Reference ref = FirebaseStorage.instance.ref().child("$idUsuari/avatar/$idUsuari");

    // Agafem la imatge de la variable que la tingui (la de web o la de App).
    if (_imatgeSeleccionadaApp != null) {
      
      try {
        await ref.putFile(_imatgeSeleccionadaApp!);
        return true;
      } catch (e) { return false; }
      
    }

    if (_imatgeSeleccionadaWeb != null) {
      
      try {
        await ref.putData(_imatgeSeleccionadaWeb!);
        return true;
      } catch (e) { return false; }
    }

    return false;
  }


  Future<String> getImatgePerfil() async{

    final String idUsuari = ServeiAuth().getUsuariActual()!.uid;
    final Reference ref = FirebaseStorage.instance.ref().child("$idUsuari/avatar/$idUsuari");

    final String urlImatge = await ref.getDownloadURL();

    return urlImatge;  
  }


  Widget mostrarImatge() {
    return FutureBuilder(
      future: getImatgePerfil(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.hasError) {

          return const Icon(Icons.person);          
        }
        return Image.network(
          snapshot.data!,
          errorBuilder: (context, error, StackTrace) {
            return Text("Error al carregar la imatge: $error");
          },
          );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Dades"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Boto per obtenir el FilePicker.
            //================================
            GestureDetector(
              onTap: _triaImatge,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                ),
                child: const Text("Tria imatge"),
              ),
            ),

            // Boto per pujar la imatge 
            //===================================
            GestureDetector(
              onTap: () async {

                if (_imatgeAPuntPerPujar) {
                  
                  bool imatgePujadaCorrectament = await pujarImargePerUsuari();

                  if (imatgePujadaCorrectament) {
                    mostrarImatge();
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                ),
                child: const Text("Pujar imatge"),
              ),
            ),


            // Visor del resultat del FilePicker
            // =================================
            Container(
              child: _imatgeSeleccionadaWeb == null && _imatgeSeleccionadaApp == null ?
              Container() : 
              kIsWeb ?
              Image.memory(_imatgeSeleccionadaWeb!, fit: BoxFit.fill,) :
              Image.file(_imatgeSeleccionadaApp!, fit: BoxFit.fill,),
            ),

            // Visor del resultat de carregar la imatge de Firebase Storage.
            Container(
              child: mostrarImatge(),
            ),
          ],
        ),
      )),
    );
  }
}