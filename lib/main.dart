import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainers/src/models/provider.dart';
import 'package:trainers/src/pages/zapato_page.dart';

void main(){

  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ZapatoModel(),)
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ZapatoPage()
    );
  }
}