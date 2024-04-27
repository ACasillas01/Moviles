import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_notes_app/content/fs_admin_table.dart';
import 'package:fire_notes_app/content/notes/item_note.dart';
import 'package:fire_notes_app/create_form/new_note_form.dart';
import 'package:fire_notes_app/create_form/notes_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final _fabKey = GlobalKey<ExpandableFabState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => FsAdminTable(),
                ),
              );
            },
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () =>
                            {context.read<NotesProvider>().getNotesByName()}),
                    border: OutlineInputBorder(),
                    labelText: "Name"),
                controller: context.watch<NotesProvider>().getSearchController),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FirestoreListView(
              padding: EdgeInsets.symmetric(horizontal: 18),
              pageSize: 15,
              query: context.watch<NotesProvider>().query,
              //.where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid),
              itemBuilder: (BuildContext context,
                  QueryDocumentSnapshot<Map<String, dynamic>> document) {
                return ItemNote(noteContent: document.data(), id: document.id);
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _fabKey,
        // type: ExpandableFabType.up,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            tooltip: "New note",
            child: Icon(Icons.file_copy),
            onPressed: () {
              print("New note button");
              _fabKey.currentState?.toggle();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => NewNoteForm(),
                ),
              );
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            tooltip: "New folder",
            child: Icon(Icons.folder),
            onPressed: () {
              _fabKey.currentState?.toggle();
            },
          ),
          FloatingActionButton.small(
              heroTag: null,
              tooltip: "Sort Notes by Date",
              child: Icon(Icons.sort),
              onPressed: () =>
                  {context.read<NotesProvider>().getAllNotesOrderedByDate()}),
        ],
      ),
    );
  }
}
