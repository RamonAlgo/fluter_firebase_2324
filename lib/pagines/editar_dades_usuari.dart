import 'dart:io';

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
              onTap: _triaImatge(){},
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
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                ),
                child: const Text("Pujar imatge"),
              ),
            )


          ],
        ),
      )),
    );
  }
}