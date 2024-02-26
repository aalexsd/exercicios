import 'package:flutter/material.dart';
import 'package:streams_application_timer/main.dart';
import 'package:streams_application_timer/pages/treino_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TreinoPage());
  }
}
