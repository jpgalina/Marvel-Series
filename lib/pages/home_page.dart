import 'package:flutter/material.dart';
import 'package:marvel_api/api/api.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextButton(
          onPressed: API.getSeries,
          child: Text('Teste'),
        ),
      ),
    );
  }
}
