import 'package:flutter/material.dart';
import 'package:marvel_api/pages/details.dart';
import 'package:marvel_api/pages/home_page.dart';
import 'package:marvel_api/routes/routes.dart';
import 'package:marvel_api/store/details.store.dart';
import 'package:marvel_api/store/series_list.store.dart';
import 'package:provider/provider.dart';
import 'dart:io';

// Para fazer a chamada na API da marvel pelo note da accenture
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  runApp(const MarvelSeries());
  HttpOverrides.global = MyHttpOverrides();
}

class MarvelSeries extends StatelessWidget {
  const MarvelSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SeriesListStore>(
          create: (_) => SeriesListStore(),
        ),
        Provider<DetailsStore>(
          create: (_) => DetailsStore(),
        )
      ],
      child: MaterialApp(
        title: 'Marvel Series',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        routes: {
          MyRoutes.home: (context) => const HomePage(),
          MyRoutes.details: (context) => const Details(),
        },
        initialRoute: MyRoutes.home,
      ),
    );
  }
}
