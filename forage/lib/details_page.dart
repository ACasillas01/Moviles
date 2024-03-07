import 'package:flutter/material.dart';
import 'package:forage/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forage'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(children: [
            Text(
              context.watch<ForageProvider>().getCurrentElem["Name"] ?? "N/A",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            ListTile(
              title: Text(
                  context.watch<ForageProvider>().getCurrentElem["Location"] ??
                      "N/A"),
              leading: const Icon(Icons.location_on),
            ),
            ListTile(
              title: Text(((context
                          .watch<ForageProvider>()
                          .getCurrentElem["InSeason"] ==
                      "true")
                  ? "Currently in season"
                  : "This item is not in season")),
              leading: const Icon(Icons.calendar_month),
            ),
            ListTile(
              title: Text(
                  context.watch<ForageProvider>().getCurrentElem["Notes"] ??
                      "No notes available"),
              leading: const Icon(Icons.notes),
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 80, 47, 220),
        onPressed: () {},
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
