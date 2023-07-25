import 'package:flutter/material.dart';
import 'package:marvel_api/pages/home_page.dart';
import 'package:marvel_api/routes/routes.dart';

void main() {
  runApp(const MarvelSeries());
}

class MarvelSeries extends StatelessWidget {
  const MarvelSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Series',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routes: {
        MyRoutes.home: (context) => HomePage(),
      },
      initialRoute: MyRoutes.home,
    );
  }
}
