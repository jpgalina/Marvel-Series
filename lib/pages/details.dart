import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_api/store/details.store.dart';
import 'package:marvel_api/store/series_list.store.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  _renderDetails(List detail) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(6),
      child: Column(
        children: detail
            .map((e) => Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 70,
                        child: Image.network(e["thumbnail"]["path"] +
                            '.${e['thumbnail']['extension']}'),
                      ),
                      if (e["name"] != null)
                        Expanded(
                          child: Center(
                            child: Text(
                              e["name"],
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      if (e["title"] != null)
                        Expanded(
                          child: Center(
                            child: Text(
                              e["title"],
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      if (e["fullName"] != null)
                        Expanded(
                          child: Center(
                            child: Text(
                              e["fullName"],
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DetailsStore>(context);
    final seriesId = ModalRoute.of(context)?.settings.arguments;
    final series = Provider.of<SeriesListStore>(context)
        .list
        .where((element) => element.id == seriesId)
        .toList()[0];

    if (store.series == null || store.series!.id != seriesId) {
      store.getDetails(series);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: Column(
        children: [
          Text(series.title!),
          const SizedBox(height: 10),
          Hero(
            tag: seriesId!,
            child: Image.network(
              series.thumbnail!,
              height: 250,
            ),
          ),
          if (series.description != null)
            Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(6),
              child: Text(
                series.description!,
                style: const TextStyle(
                  fontSize: 12,
                ),
                softWrap: true,
                maxLines: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          Observer(
            builder: (context) {
              if (store.isFetching) {
                return const Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              } else if (store.fetchError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Ops! Parece que ocorrreu um problema com a chamada, clique no botão abaixo para tentar novamente.',
                      ),
                      TextButton(
                        onPressed: () => store.getDetails(series),
                        child: const Text('Tentar de novo!'),
                      )
                    ],
                  ),
                );
              } else {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (store.series!.comics!.isNotEmpty)
                          const Center(child: Text('Comics')),
                        _renderDetails(store.series!.comics!),
                        if (store.series!.characters!.isNotEmpty)
                          const Center(child: Text('Characters')),
                        _renderDetails(store.series!.characters!),
                        if (store.series!.events!.isNotEmpty)
                          const Center(child: Text('Events')),
                        _renderDetails(store.series!.events!),
                        if (store.series!.creators!.isNotEmpty)
                          const Center(child: Text('Creators')),
                        _renderDetails(store.series!.creators!),
                      ],
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
