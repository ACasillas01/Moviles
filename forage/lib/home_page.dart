import 'package:flutter/material.dart';
import 'package:forage/add_forage.dart';
import 'package:forage/details_page.dart';
import 'package:forage/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forage'),
      ),
      body: ListView.builder(
          itemCount: context.watch<ForageProvider>().getElems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                context.watch<ForageProvider>().getElems[index]["Name"] ??
                    "N/A",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(context.watch<ForageProvider>().getElems[index]
                      ["Location"] ??
                  "No Location Provided"),
              onTap: () {
                context.read<ForageProvider>().setCurrentElem({
                  "Name": context.read<ForageProvider>().getElems[index]
                          ["Name"] ??
                      "N/A",
                  "Location": context.read<ForageProvider>().getElems[index]
                          ["Location"] ??
                      "No Location Provided",
                  "InSeason": context.read<ForageProvider>().getElems[index]
                          ["InSeason"] ??
                      "No season provided",
                  "Notes": context.read<ForageProvider>().getElems[index]
                          ["Notes"] ??
                      "No Notes"
                });

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DetailsPage()));
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 80, 47, 220),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddForage()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
