import 'dart:ui';

import 'package:flutter/material.dart' show AlertDialog, BuildContext, Colors, Column, Container, EdgeInsets, ElevatedButton, InputDecoration, MainAxisAlignment, Material, MaterialPageRoute, MediaQuery, Navigator, OutlineInputBorder, Padding, RadioMenuButton, Scaffold, SingleChildScrollView, SizedBox, SnackBar, Stack, State, StatefulWidget, Text, TextButton, TextField, TextInputType, Widget, showDialog;
import 'package:flutter/widgets.dart';
import 'package:login/HomePage.dart';
//cria o estado para ser usado na pagina principal
class login_page extends StatefulWidget {
  const login_page({super.key});
  @override
  State<login_page> createState() => _login_pageState();
}
//faz o estado ou o objeto
class _login_pageState extends State<login_page> {
  //cria variaveis
  String email = '';
  String senha = '';
  String resposta = '';
  //cria todo login pra ser exibido depois
  Widget body() {
    //cria a interface
   return Scaffold(
      //faz a tela poder se mexer
      body: SingleChildScrollView(
      //cria um input melhor
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.all(8.0),
      //cria a coluna
      child: Column(
        //alinha a coluna
        mainAxisAlignment: MainAxisAlignment.center,
        //cria as coisas que apareceram na coluna
        children: [
          //cria um input
          TextField(
            //pega o valor do input
            onChanged: (Text){
              email = Text;
            },
            //faz o input ser type email
            keyboardType: TextInputType.emailAddress,
            //cria um uma interface do input 
            decoration: InputDecoration(
              //cria tipo um placehouter no input
              labelText: 'email',
              //cria o formato de input
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            //pega o valor do input
            onChanged: (Text){
              senha = Text;
            },
            //faz o input virar de password
            obscureText: true,
            //cria um uma interface do input 
            decoration: InputDecoration(
              //cria tipo um placehouter no input
              labelText: 'senha',
              //cria o formato de input
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          //cria o button de enviar
          ElevatedButton(
            //cria a programação do button
          onPressed: () {
             if (email=='teste' && senha=='1234') {
              //manda para outra pagina mas apenas sobrepoe. pushReplacement não teria como voutar
              //  Navigator.of(context).push(
              //    MaterialPageRoute(builder: (context) => HomePage()),
              //  );
              //esse usa a route no app_widget e também tem pushReplacementNamed
              Navigator.of(context).pushNamed('/home');
             } else {
              showDialog(
               context: context,
               builder: (context) {
                 return AlertDialog(
                   title: Text('Erro'),
                   content: Text('O email ou a senha estão incorretos.'),
                   actions: [
                     TextButton(
                       child: Text('OK'),
                       onPressed: () {
                         Navigator.of(context).pop();
                       },
                     ),
                   ],
                 );
               },
              );
                setState(() {
                 resposta = 'você não existe';
                });
                
              //  print('você não existe');
             }
          },
          //cria o text do button
          child: Text('Entrar'),
         ),
         Text('$resposta'),
        ],
      ),
     ),
    ),
  ),
); 
  }
  @override
  Widget build(BuildContext context) {
    //em teoria cria um background colors
    return Scaffold(
      body: Stack(
        children: [
          //define a cor
        Container( color: Colors.blue),
        //exibi o body crado anteriormente
        body()
        ],
      ),
    );
  }
}