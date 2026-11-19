import 'dart:convert';

import 'package:flutter/material.dart';

import'package:http/http.dart' as http;

class telainicio extends StatefulWidget {
  const telainicio({super.key});

  @override
  State<telainicio> createState() => _telainicioState();


  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const 
                      Text('bem-vindo'),
                  const
                      SizedBox(height: 20,),
                  const SizedBox(width: 20,),

                ],
              ),
          ),
        );
  }

  

}
    class _telainicioState extends State<telainicio> {
      final _formKey = GlobalKey<FormState>();

      final _emailController = TextEditingController();
      final _senhaController = TextEditingController();

      bool _mostrarSenha = false;
      bool _carregando = false;

      final String baseURL = 'http://127.0.0.1:8000';

      @override
      void dispose() {
        _emailController.dispose();
        _senhaController.dispose();
        super.dispose();
      }

      Future<void> _fazerLogin() async {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        try {
          final response = await http.post(
              Uri.parse('$baseURL/login'),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode({
                'email': _emailController.text.trim(),
                'senha': _senhaController.text,

              })
          );
          if (!mounted) return;
          if (response.statusCode == 200) {
            final dados = jsonDecode(response.body);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(dados['message'] ?? 'login realizado',
              ),
                backgroundColor: Colors.green,
              ),


            );
          } else if (response.statusCode == 401) {
            final dados = jsonDecode(response.body);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(dados['detail'] ?? 'email invalido',
                ),
                  backgroundColor: Colors.red,)
            );
          }
        } catch (e) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('verificar a conexao',
              ),
                backgroundColor: Colors.red,
              )
          );
        }
      }

      @override
      Widget build(BuildContext context){
        return Scaffold(
          backgroundColor: const Color(0xFFF5F5FF),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 400),
              child: Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
                child: Padding(padding: const EdgeInsetsGeometry.all(24),
                child: Form(key: _formKey,
                child: Column(mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [const Icon(Icons.lock_outline,size: 64,color:Color(0xFF2E7032),

                ),
                  const SizedBox(height: 16),
                  const Text('ben-vindo',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28,
                  fontWeight: FontWeight.bold,color: Color(0xFF212121),
                  ),
                  ),
                  const SizedBox(height: 8,),

                  const Text('entre com seu email e senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF757575),
                  ),
                  ),

                  const SizedBox(height: 32,),

                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'email',
                      hintText: 'text@email.com',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator:(value){
                      if(value == null || value.trim().isEmpty){
                        return "informe seu email!";
                      }
                      if(!value.contains("@")||!value.contains(".")){
                        return "informe seu email valido";
                      }
                      return null;
                    }
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: _senhaController,
                    obscureText: !_mostrarSenha,
                    decoration: InputDecoration(
                      labelText: 'senha',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(icon: Icon(_mostrarSenha? Icons.visibility_off:Icons.visibility,),
                      onPressed: () {
                        setState(() {
                          _mostrarSenha = !_mostrarSenha;
                        });
                      }
                      ),
                        border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe sua senha.';
                      }
                      return null;
                    },
                  ),

                const SizedBox(height: 28,),

                  ElevatedButton(onPressed: _carregando? null:_fazerLogin,style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32),foregroundColor: Colors.white,padding: const EdgeInsets.symmetric(vertical: 16,),shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))), child: _carregando? const SizedBox(width: 22,height: 22, child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),)

                  :const Text('entre', style: TextStyle(fontSize: 16),)
                  )

                ],

                ),),),
              )),
            ),
          ),
        );
      }
    }






