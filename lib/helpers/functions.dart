import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

void pushScreen(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

void pushReplacementScreen(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget, fullscreenDialog: true),
  );
}

void overlayScreen(BuildContext context, Widget widget) {
  showMaterialModalBottomSheet(
    context: context,
    expand: true,
    builder: (context) => widget,
  );
}

String randomString(int length) {
  const randomChars =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  const charsLength = randomChars.length;
  final rand = Random();
  final codeUnits = List.generate(
    length,
    (index) {
      final n = rand.nextInt(charsLength);
      return randomChars.codeUnitAt(n);
    },
  );
  return String.fromCharCodes(codeUnits);
}

Future<int?> getPrefsInt(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}

Future setPrefsInt(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

Future<String?> getPrefsString(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future setPrefsString(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<bool?> getPrefsBool(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key);
}

Future setPrefsBool(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

Future removePrefs(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}
