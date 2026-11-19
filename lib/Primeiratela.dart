import 'package:flutter/material.dart';
import 'package:conexao/telainicio.dart';
import 'telainicio.dart';
import 'package:conexao/segundapagina.dart';

class Primeiratela extends StatelessWidget {
  const Primeiratela({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center, children: [
            const
            Text(
                "bem vindo a lojinha "
            ),
            const
            SizedBox(height: 20,),
            const SizedBox(width: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('lojinha.jpg', width: 300, height: 500,),
            ],),
            ElevatedButton(onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => segundapagina(),),);
            },
                child: const Text("Acessar segunda pagina!")),
            const SizedBox(height: 4,),

            ConstrainedBox(constraints: const BoxConstraints(maxWidth: 300),
                child: SizedBox(width: double.infinity, child:
                ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),),
                    elevation: 5), onPressed: () {
                  print("botao clicado");
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => telainicio(),),);
                },
                    child: const Text("entrar", style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 16),)),)),

          ],

          ),
        ),
      );
  }

}