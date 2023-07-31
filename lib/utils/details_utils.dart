import 'package:flutter/material.dart';

Widget buildCard(Map<String, dynamic> data) {
  return Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 70,
          child: Image.network(
              '${data["thumbnail"]["path"]}.${data["thumbnail"]["extension"]}'),
        ),
        Expanded(
          child: Center(
            child: Text(
              data["name"] ?? data["title"] ?? data["fullName"] ?? "",
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget renderDetails(List<dynamic> detail) {
  return Container(
    padding: const EdgeInsets.all(6),
    margin: const EdgeInsets.all(6),
    child: Column(
      children: detail.map((e) => buildCard(e)).toList(),
    ),
  );
}
