import 'package:crud_app_with_provider/provider/crud_provider.dart';
import 'package:crud_app_with_provider/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ChangeNotifierProvider(
        create: (_) => CrudProvider() , )
    ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(


      ),
    )
    );

   
  }
}
