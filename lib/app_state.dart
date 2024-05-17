import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _auth = prefs.getBool('ff_auth') ?? _auth;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? value) {
    _dateTime = value;
  }

  bool _auth = false;
  bool get auth => _auth;
  set auth(bool value) {
    _auth = value;
    prefs.setBool('ff_auth', value);
  }

  List<String> _ingredience = [];
  List<String> get ingredience => _ingredience;
  set ingredience(List<String> value) {
    _ingredience = value;
  }

  void addToIngredience(String value) {
    _ingredience.add(value);
  }

  void removeFromIngredience(String value) {
    _ingredience.remove(value);
  }

  void removeAtIndexFromIngredience(int index) {
    _ingredience.removeAt(index);
  }

  void updateIngredienceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _ingredience[index] = updateFn(_ingredience[index]);
  }

  void insertAtIndexInIngredience(int index, String value) {
    _ingredience.insert(index, value);
  }

  bool _addIngred = true;
  bool get addIngred => _addIngred;
  set addIngred(bool value) {
    _addIngred = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
