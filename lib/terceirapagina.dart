import 'package:flutter/material.dart';
import 'package:conexao/terceirapagina.dart';

import 'package:conexao/telainicio.dart';

class terceirapagina extends StatelessWidget{
  final String titulo;
  final String preco;
  const terceirapagina({super.key, required this.titulo, required this.preco});
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: const Color(0xFF0F172A),
          appBar: AppBar(
            backgroundColor: const Color(0xFF1E293B),
            title: Text(titulo, style: const TextStyle(color: Colors.cyan),),
            iconTheme: const IconThemeData(color: Colors.cyan),
          ),
          body: Padding(padding: const EdgeInsets.all(24.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(height: 24),
              Text(titulo,style: const TextStyle(color: Colors.white,fontSize:22,fontWeight: FontWeight.bold),),
              const SizedBox(height: 24),
              Text(preco,style: const TextStyle(color: Colors.cyan, fontSize:22,fontWeight: FontWeight.bold ),),
              SizedBox(
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan , foregroundColor: Colors.black,padding: const EdgeInsets.symmetric(vertical: 16),), onPressed:(){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("adiciondado ao carrinho"),),);
                },
                    child: const Text("deseja adicionar ao carrinho",style: TextStyle(fontWeight: FontWeight.bold),),)
              ),

            ],
          ),
          ),
        );


  }
}