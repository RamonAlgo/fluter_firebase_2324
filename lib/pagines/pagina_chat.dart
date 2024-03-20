import 'package:flutter/material.dart';

class PaginaChat extends StatefulWidget {
  const PaginaChat({super.key});

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amb aqui parlem"),
      ),
      body: Column(
        children: [

          //zona missatges.
          Expanded(child:_construirLlistaMissatges(

          )),
          
          
          //zona escriure missatge.
          _construirZonaInputUsuari(),

        ],
      ),
    );
  }

  Widget _construirLlistaMissatges() {

    return Container();
  }

  Widget _construirZonaInputUsuari() {

    return Container();
  }
}