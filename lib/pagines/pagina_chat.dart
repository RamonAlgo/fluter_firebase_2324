import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaginaChat extends StatefulWidget {

  final String emailAmbQuiParlem;

  const PaginaChat({
    super.key,
    required this.emailAmbQuiParlem,
    });

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {

  final TextEditingController controllerMissatge = TextEditingController();
  void enviarMissatge() {
    if (controllerMissatge.text.isNotEmpty) {
      
      // Enviar el missatge.
      

      // Netejar el camp.
      controllerMissatge.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.emailAmbQuiParlem),
      ),
      body: Column(
        children: [

          //zona missatges.
          Expanded(child:_construirLlistaMissatges()),
          
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controllerMissatge,
              decoration: InputDecoration(
                fillColor: Colors.amber[100],
                filled: true,
                hintText: "Escriu el missatge...",
              ),
            ),
          ),
          const SizedBox(width: 10,),
            IconButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                
              ),
              icon: Icon(Icons.send),
              color: Colors.white,
              onPressed: enviarMissatge,
            ),
          ],
      ),
    );
  }
}