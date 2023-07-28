import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_api/store/series_list.store.dart';
import 'package:marvel_api/widgets/series.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SeriesListStore>(context);

    if (store.list.isEmpty) {
      store.fillList();
    }

    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Series"),
        ),
        body: store.isFetching
            ? const Center(child: CircularProgressIndicator())
            : store.fetchError
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Ops! Parece que ocorrreu um problema com a chamada, clique no botão abaixo para tentar novamente.'),
                        TextButton(
                            onPressed: store.fillList,
                            child: Text('Tentar de novo!'))
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: store.list.length,
                    itemBuilder: (context, index) {
                      return SeriesWidget(series: store.list[index]);
                    },
                  ),
      );
    });
  }
}
