import 'package:flutter/material.dart';
import 'package:flutter/material.dart' show BuildContext, Center, Colors, Container, GestureDetector, MaterialApp, State, StatelessWidget, Text, ThemeData, Widget, runApp;
import 'package:login/app_controler.dart';
import 'package:login/app_widget.dart';
import 'package:login/login_page.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cria um menu de botao
      drawer: Drawer(
        //cria os itens no menu
        child: Column(
          //faz os itens
          children: [
            //coloca nomes de usuario email
            UserAccountsDrawerHeader(
             // currentAccountPicture: Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Folhardigital.com.br%2F2022%2F07%2F29%2Fcinema-e-streaming%2F7-filmes-de-arnold-schwarzenegger-para-celebrar-os-75-anos-do-ator%2F&psig=AOvVaw2BIdyFvKkT-6WlvFFDl1a1&ust=1709253451094000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPia_7-nz4QDFQAAAAAdAAAAABAJ'),
              accountName: Text('Raul '), 
              accountEmail: Text('teste@teste.com'),
              ),
            //monta os itens
           ListTile(
            //cria um iconne a esquerda
            leading: Icon(Icons.home),
             title: Text('Inicio'),
             subtitle: Text('Tela de inicio'),
             //faz a area ser clicavel
             onTap: () {
               print('home');
             },
           ),
           ListTile(
            //cria um iconne a esquerda
            leading: Icon(Icons.home),
            //esses se auto esplicam
             title: Text('Sair'),
             subtitle: Text('Tela de saida'),
             //faz a area ser clicavel
             onTap: () {
               Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => login_page()),
               );
             },
           ),
          ],
        ),
      ),
      //cria a parte de cima da tela
      appBar: AppBar(
        //cria o texto da parte de cima da tela
        title: Text('Home Page'),
        //cria algo que no caso é a mudança de cor
        actions: [CustonSwitch()],
      ),
      //poderia ser Row que é linha ou ListView caso ultrapasse a tela para poder rolar para baixo
      body: Container(
        //define o tamanho do conteiner
        width: double.infinity,
        height: double.infinity,
        //cria uma coluna que o tamanho foi definido acima
        child: Column(
          //faz o alinhamento da coluna no caso de ser ListView usar scrollDiretion: Axis.Vertical ou Horizontal
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          //é oque aparece na tela na configuração de linha ou coluna
          children: [
            //cria um texto na tela que ao ser clicado aumenta 1
            GestureDetector( child: Text('Contador $count', style: TextStyle(fontSize: 20.00 , color: Colors.blue)),onTap: () {
            setState(() {
            count++;  
            });
          },
        ),
          ],
        ),
      ),
      //cria um button que ao ser clicado aumenta 1 e exibi em TEXT que é onde esta a variavel
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),  onPressed: () {
        setState(() {
            count++;  
            });
      },), 
    );
  }
}
//cria um button de mudança de estado que é usado em APPbar
class CustonSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(value: appcontroler.instance.isdarktheme, onChanged:(value) {
         appcontroler.instance.ChangeTheme();
        }
        );
  } 
}