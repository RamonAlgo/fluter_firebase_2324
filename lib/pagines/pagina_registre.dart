import 'package:fluter_firebase_2324/components/boto_auth.dart';
import 'package:fluter_firebase_2324/components/textfield_auth.dart';
import 'package:flutter/material.dart';

class PaginaRegistre extends StatelessWidget {

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmarPassword = TextEditingController();

  PaginaRegistre({
    super.key,
    });


  void ferRegistre() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 183, 159),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
                  // Logo.
                  const Icon(
                    Icons.fireplace,
                    size: 120,
                    color: Color.fromARGB(255, 255, 240, 218),
                  ),
                  
                  const SizedBox(height: 10,),
            
                  // Frase
              
                  const Text(
                    "Crear un conte nou",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 240, 218),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
              
                  // Text divisori
            
                  const SizedBox(height: 10,),
            
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25,),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 3,
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            "Registrat",
                            style: TextStyle(color: Color.fromARGB(255, 255, 240, 218),),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 3,
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  // TextField Email.
              
                  TextFieldAuth(
                    controller: controllerEmail,
                    hintText: "Email",
                    obscureText: false, 
                  ),
            
                  // TextField Password
              
                  TextFieldAuth(
                    controller: controllerPassword,
                    hintText: "Password",
                    obscureText: true, 
                  ),
            
                  
            
                  // No estàs registra/da
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Ja ets membre?"),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Fes login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  const SizedBox(height: 10,),
            
                  // Boto login
                  BotoAuth(
                    text: "Registre",
                    onTap: ferRegistre,
                  ),
            
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}