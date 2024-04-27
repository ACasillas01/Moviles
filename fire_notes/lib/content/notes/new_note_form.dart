import 'package:flutter/material.dart';

class NewNoteForm extends StatelessWidget {
  NewNoteForm({super.key});
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
            ),
            const SizedBox(
              width: 24,
            ),
            TextField(
              controller: _contentController,
            )
          ],
        ),
      )),
    );
  }
}
