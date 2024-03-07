import 'package:flutter/material.dart';
import 'package:forage/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class AddForage extends StatelessWidget {
  const AddForage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
              controller: context.watch<ForageProvider>().getNameController,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Location"),
              controller: context.watch<ForageProvider>().getLocationController,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                    value: context.watch<ForageProvider>().getInSeason,
                    activeColor: Colors.greenAccent,
                    onChanged: (value) {
                      context.read<ForageProvider>().inSeasonChange();
                    }),
                const Text("Currenty in season")
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Notes"),
              controller: context.watch<ForageProvider>().getNotesController,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      onPressed: () {
                        context.read<ForageProvider>().createMap();
                        context.read<ForageProvider>().resetFields();
                        Navigator.pop(context);
                      },
                      color: const Color.fromARGB(255, 80, 47, 220),
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(width: 10),
                  MaterialButton(
                      onPressed: () {
                        context.read<ForageProvider>().resetFields();
                      },
                      color: const Color.fromARGB(255, 80, 47, 220),
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
