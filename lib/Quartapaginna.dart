import 'package:flutter/material.dart';
import 'package:conexao/terceirapagina.dart';
import 'package:conexao/terceirapagina.dart';
import 'package:conexao/telainicio.dart';

class Quartapaginna  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: const Color(0xFF0D1628),
          appBar: AppBar(
            backgroundColor: const Color(0xFF224B93),
            title: const Text('carrinho',style: TextStyle(color: Colors.cyan),),
          ),
          body: const Center(
            child: Text('carrinho vazio '),
          ),

        );
  }
}