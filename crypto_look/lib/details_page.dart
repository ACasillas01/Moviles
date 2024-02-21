import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  final String year;
  final String description;
  final String image;

  const DetailsPage(
      {super.key,
      required this.name,
      required this.year,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.network(
              image,
              scale: .5,
              height: 64,
              width: 64,
            ),
            const SizedBox(height: 40),
            Text(
              "$name, $year",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  ((description == "")
                      ? "No description available"
                      : description),
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                )),
          ],
        ),
      ),
    );
  }
}
