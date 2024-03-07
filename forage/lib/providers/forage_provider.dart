import 'package:flutter/material.dart';

class ForageProvider with ChangeNotifier {
  List<Map<String, String>> _elems = [];
  List<Map<String, String>> get getElems => _elems;

  Map<String, String> _currentElem = {};
  Map<String, String> get getCurrentElem => _currentElem;

  final _nameController = TextEditingController();
  TextEditingController get getNameController => _nameController;
  final _locationController = TextEditingController();
  TextEditingController get getLocationController => _locationController;
  bool _inSeason = false;
  bool get getInSeason => _inSeason;
  final _notesController = TextEditingController();
  TextEditingController get getNotesController => _notesController;

  void _addElem(Map<String, String> elem) {
    if (elem.containsKey("Name") &&
        elem.containsKey("Location") &&
        elem.containsKey("InSeason") &&
        elem.containsKey("Notes")) {
      _elems.add(elem);
    } else {}

    notifyListeners();
  }

  void createMap() {
    Map<String, String> newMap = {
      "Name": _nameController.text,
      "Location": _locationController.text,
      "InSeason": _inSeason.toString(),
      "Notes": _notesController.text
    };
    _addElem(newMap);
  }

  void inSeasonChange() {
    _inSeason = !_inSeason;
    notifyListeners();
  }

  void resetFields() {
    _nameController.clear();
    _locationController.clear();
    _notesController.clear();
    _inSeason = false;
    notifyListeners();
  }

  void setCurrentElem(Map<String, String> elem) {
    _currentElem = elem;
    notifyListeners();
  }
}
