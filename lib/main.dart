import 'package:flutter/material.dart';
import 'package:prj_1/loginpage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloggy',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(title: TextStyle( color: Colors.white, fontSize: 18,),),
      ),
      home: LoginPage(),
      
      // home: getCurrentUser() != null ? MyHomePage(() => user) : LoginPage(),
    );
  }
}

