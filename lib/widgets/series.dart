import 'package:flutter/material.dart';
import 'package:marvel_api/model/series.dart';

class SeriesWidget extends StatelessWidget {
  Series series;

  SeriesWidget({
    required this.series,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: SizedBox(
              width: 130,
              height: 70,
              child: FittedBox(
                fit: BoxFit.cover,
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  series.thumbnail!['path'].toString(),
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'lib/assets/img/marvel-logo.png',
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(series.title!),
                if (series.description != null)
                  Text(
                    series.description!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
