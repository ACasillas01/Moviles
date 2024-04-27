import 'package:fire_notes_app/content/notes/edit_note.dart';
import 'package:flutter/material.dart';
import 'package:fire_notes_app/create_form/notes_provider.dart';
import 'package:provider/provider.dart';

class ItemNote extends StatelessWidget {
  final String id;
  final Map<String, dynamic> noteContent;
  ItemNote({super.key, required this.noteContent, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // color: noteContent["color"],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Text(noteContent["data"]["title"]),
          Expanded(child: Text("")),
          IconButton(
              onPressed: () => {
                    context.read<NotesProvider>().resetSelectedPicture(),
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditNote(
                              currentNote: this.noteContent,
                              id: this.id,
                            )))
                  },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () =>
                  {context.read<NotesProvider>().removeExistingNote(id)},
              icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
