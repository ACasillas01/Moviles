import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NotesProvider with ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  TextEditingController get getSearchController => searchController;
  Query<Map<String, dynamic>> _query =
      FirebaseFirestore.instance.collection("notes");
  get query => _query;
  bool _sorted = false;
  bool isLoading = false;
  File? _selectedPicture;
  File? get getSelectedImage => _selectedPicture;
  void getAllNotes() async {
    try {
      var q = FirebaseFirestore.instance.collection("notes");
      _query = q;
    } catch (e) {
      print("Error: ${e.toString()}");
    }

    notifyListeners();
  }

  Future<void> getNote(String noteReference) async {
    try {
      FirebaseFirestore.instance.collection("notes").doc(noteReference).get();
    } catch (e) {
      print("Error: ${e.toString()}");
    }
    notifyListeners();
  }

  void getAllNotesOrderedByDate() async {
    if (_sorted == false) {
      try {
        var q =
            FirebaseFirestore.instance.collection("notes").orderBy('createdAt');
        _query = q;
        _sorted = true;
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    } else {
      _query = FirebaseFirestore.instance.collection("notes");
      _sorted = false;
      print("Sorted reset");
    }

    notifyListeners();
  }

  void getNotesByName() async {
    print(searchController.text);
    try {
      if (searchController.text != "") {
        var q = FirebaseFirestore.instance
            .collection("notes")
            .where("data.title", isEqualTo: searchController.text);
        print(q);
        _query = q;
      } else {
        _query = FirebaseFirestore.instance.collection("notes");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
    notifyListeners();
  }

  Future<bool> createNewNote(Map<String, dynamic> noteContent) async {
    try {
      isLoading = true;
      notifyListeners();
      String _imageUrl = await _uploadPictureToStorage();
      if (_imageUrl != "") noteContent['data']['images'] = [_imageUrl];
      await FirebaseFirestore.instance.collection("notes").add(noteContent);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      print("Error: ${e.toString()}");
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> editExistingNote(
      String noteReference, Map<String, dynamic> noteContent) async {
    try {
      await FirebaseFirestore.instance
          .collection("notes")
          .doc(noteReference)
          .update(noteContent);
      notifyListeners();
      return true;
    } catch (e) {
      print("Error: ${e.toString()}");
      return false;
    }
  }

  void removeExistingNote(String noteReference) async {
    try {
      await FirebaseFirestore.instance
          .collection("notes")
          .doc(noteReference)
          .delete();
      notifyListeners();
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  Future<String> _uploadPictureToStorage() async {
    try {
      if (_selectedPicture == null) return "";
      //
      var stamp = DateTime.now();
      UploadTask task = FirebaseStorage.instance
          .ref('notas/imagen_${stamp}.png')
          .putFile(_selectedPicture!);
      await task;
      return await task.storage
          .ref('notas/imagen_${stamp}.png')
          .getDownloadURL();
    } catch (e) {
      print("Error al subir imagen al storage " + e.toString());
      return "";
    }
  }

  void resetSelectedPicture() {
    _selectedPicture = null;
  }

  Future<void> takePicture() async {
    isLoading = true;
    notifyListeners();
    await _getImage();
    isLoading = false;
    notifyListeners();
  }

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 720,
        maxWidth: 720,
        imageQuality: 85);
    if (pickedFile != null) {
      _selectedPicture = File(pickedFile.path);
    } else {
      print("No image selected");
      _selectedPicture = null;
    }
  }
}
