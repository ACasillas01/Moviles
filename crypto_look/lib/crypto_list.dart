import 'package:flutter/material.dart';

import 'details_page.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({
    super.key,
    required this.cryptos,
  });

  final List cryptos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cryptos.length,
      itemBuilder: (BuildContext context, int index) {
        if (cryptos[index]["image"] == "" || cryptos[index]["image"] == null) {
          return ListTile(
            title: Text(cryptos[index]["name"]),
            subtitle: Text(
                "${cryptos[index]["country"]}\n${(cryptos[index]["year_established"] ?? "N/A")}"),
            trailing:
                CircleAvatar(child: Text("${cryptos[index]["trust_score"]}")),
            leading: const Placeholder(fallbackHeight: 24, fallbackWidth: 24),
          );
        } else {
          return ListTile(
            title: Text(cryptos[index]["name"]),
            subtitle: Text(
                "${cryptos[index]["country"]}\n${(cryptos[index]["year_established"] ?? "N/A")}"),
            trailing:
                CircleAvatar(child: Text("${cryptos[index]["trust_score"]}")),
            leading: Image.network(cryptos[index]["image"]),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                      name: "${cryptos[index]["name"]}",
                      year: "${(cryptos[index]["year_established"] ?? "N/A")}",
                      image: cryptos[index]["image"],
                      description: cryptos[index]["description"])));
            },
          );
        }
      },
    );
  }
}
