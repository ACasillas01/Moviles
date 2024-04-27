import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_notes_app/create_form/notes_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditNote extends StatelessWidget {
  final String id;
  final Map<String, dynamic> currentNote;
  EditNote({super.key, required this.currentNote, required this.id});
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar nota"),
      ),
      body: Consumer<NotesProvider>(
        builder: (context, notesProvider, child) {
          if (notesProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else
            return Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: [
                  SizedBox(height: 24),
                  notesProvider.getSelectedImage != null
                      ? Image.file(notesProvider.getSelectedImage!)
                      : Container(),
                  TextField(
                    controller: _titleController
                      ..text = this.currentNote["data"]["title"],
                    decoration: InputDecoration(
                      label: Text("Title"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: _contentController
                      ..text = this.currentNote["data"]["details"],
                    decoration: InputDecoration(
                      label: Text("Descripcion"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(height: 24),
                  MaterialButton(
                    child: Text("Seleccionar imagen"),
                    onPressed: () {
                      context.read<NotesProvider>().takePicture();
                    },
                  ),
                  MaterialButton(
                    child: Text("Guardar"),
                    onPressed: () async {
                      Map<String, dynamic> noteContent = {};
                      noteContent = {
                        "color": "${Colors.green.toString()}",
                        "createdAt": Timestamp.fromDate(DateTime.now()),
                        "type": "normal",
                        "userId": FirebaseAuth.instance.currentUser!.uid,
                        "data": {
                          "audios": [],
                          "images": [],
                          "details": _contentController.text,
                          "title": _titleController.text,
                        }
                      };
                      notesProvider
                          .editExistingNote(this.id, noteContent)
                          .then((success) {
                        if (success) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text("Guardado con exito!!"),
                              ),
                            );
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text("No se pudo guardar!!"),
                              ),
                            );
                        }
                      });
                    },
                  )
                ],
              ),
            );
        },
      ),
    );
  }
}
