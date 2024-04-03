import 'package:flutter/material.dart';
import 'package:login/HomePage.dart';
import 'package:login/app_controler.dart';
import 'package:login/login_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: appcontroler.instance, builder: (context, child){
     return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red,
       brightness: appcontroler.instance.isdarktheme ? Brightness.dark : Brightness.light,
       ),
       //ou HomePage(),
      // home: login_page(),
      initialRoute: '/',
      routes: {
        '/':(context) => login_page(),
        '/home':(context) => HomePage(),
      },
    );
    }
    );
  }
}
