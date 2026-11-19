

import 'package:flutter/material.dart';
import 'package:conexao/terceirapagina.dart';
import 'package:conexao/Quartapaginna.dart';
import 'terceirapagina.dart';
import 'package:conexao/telainicio.dart';
class segundapagina extends StatelessWidget {
  const segundapagina({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
              'LOJA TECH', style: TextStyle(color: Colors.amber)),
          iconTheme: const IconThemeData(color: Colors.amber),
          actions: [
            IconButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => terceirapagina(titulo: 'smartphone', preco: '24,00', )));}, icon: const Icon(Icons.shopping_cart)),
            IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Quartapaginna()));}, icon: const Icon(Icons.person))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('destaques',style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold)),
            const SizedBox(height: 16,),

            _itemProduto(
              context,
              titulo:'smartphone',
              preco:'24,00',
              imagem: Image.asset('smartphone.jpg',width: 200,height: 300,)
            ),
            const SizedBox(height: 12),
            _itemProduto(
              context,
              titulo:'computador',
              preco:'34,00',
               imagem: Image.asset('computador.jpg',width: 200,height: 300,)
            ),
            const SizedBox(height: 12),
            _itemProduto(
              context,
              titulo:'fone bluetooth',
              preco:'44,00',
              imagem: Image.asset('fone.jpg',width: 100,height: 300,)
            ),
            const SizedBox(height: 12),
            
          ],
        ),
      );
  }
  Widget _itemProduto(BuildContext context,{required titulo,required preco,required imagem}){
    return ListTile(
      tileColor: const Color(0xFF1E293B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: Icon(imagem, color: Colors.cyanAccent, size: 36),
      title: Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(preco, style: const TextStyle(color: Colors.cyanAccent)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
    );

  }


}