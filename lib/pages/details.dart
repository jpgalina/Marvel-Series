import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_api/store/details.store.dart';
import 'package:marvel_api/store/series_list.store.dart';
import 'package:marvel_api/widgets/series.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  _renderDetails(List detail) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(6),
      child: Column(
          children: detail.map((e) => Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 70,
                  child: Image.network(e["thumbnail"]["path"] + '.${e['thumbnail']['extension']}'),
                ),
                if(e["name"] != null)
                Center(
                  child: Text(e["name"]),
                ),
                if(e["title"] != null)
                Center(
                  child: Text(e["title"]),
                ),
                if(e["fullName"] != null)
                Center(
                  child: Text(e["fullName"]),
                ),
              ],
            ),
          )).toList(), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DetailsStore>(context);
    final seriesId = ModalRoute.of(context)?.settings.arguments;
    final series = Provider.of<SeriesListStore>(context).list.where((element) => element.id == seriesId).toList()[0];

    if (store.series == null) {
      store.getDetails(series);
    }

    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes"),
        ),
        body: store.isFetching
            ? const Center(child: CircularProgressIndicator())
            : store.fetchError
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            'Ops! Parece que ocorrreu um problema com a chamada, clique no botão abaixo para tentar novamente.'),
                        TextButton(
                            onPressed: () => store.getDetails(series),
                            child: const Text('Tentar de novo!'))
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(store.series!.title!),
                        const SizedBox(height: 10),
                        Image.network(store.series!.thumbnail!),
                        if (store.series!.description != null)
                          Container(
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.all(6),
                            child: Text(
                              store.series!.description!,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                              softWrap: true,
                              maxLines: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if(store.series!.comics!.isNotEmpty)
                          const Center(child: Text('Comics')),
                          _renderDetails(store.series!.comics!),
                          if(store.series!.characters!.isNotEmpty)
                          const Center(child: Text('Characters')),
                          _renderDetails(store.series!.characters!),
                          if(store.series!.events!.isNotEmpty)
                          const Center(child: Text('Events')),
                          _renderDetails(store.series!.events!),
                          if(store.series!.creators!.isNotEmpty)
                          const Center(child: Text('Creators')),
                          _renderDetails(store.series!.creators!),
                      ],
                    ),
                  ),
      );
    });
  }
}
