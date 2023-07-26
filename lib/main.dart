import 'package:flutter/material.dart';
import 'package:marvel_api/pages/home_page.dart';
import 'package:marvel_api/routes/routes.dart';
import 'package:marvel_api/store/series_list.store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MarvelSeries());
}

class MarvelSeries extends StatelessWidget {
  const MarvelSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SeriesListStore>(
          create: (_) => SeriesListStore(),
        )
      ],
      child: MaterialApp(
        title: 'Marvel Series',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        routes: {
          MyRoutes.home: (context) => HomePage(),
        },
        initialRoute: MyRoutes.home,
      ),
    );
  }
}
