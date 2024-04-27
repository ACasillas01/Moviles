import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class FsAdminTable extends StatelessWidget {
  FsAdminTable({super.key});

  final tweetCollection = FirebaseFirestore.instance.collection('tweet');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin table"),
        ),
        body: FirestoreDataTable(
          query: tweetCollection,
          columnLabels: {
            "description": Text("Description"),
            "osystem": Text("OS"),
            "picture": Text("Imagen"),
            "public": Text("Visible"),
            "username": Text("username"),
            "stars": Text("Likes"),
            "title": Text("Title"),
            "publishedAt": Text("Fecha")
          },
        ));
  }
}
