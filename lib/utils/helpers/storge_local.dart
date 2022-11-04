import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageDataLocal {
  static getData(String key) async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      return localStorage.getString(key);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static storeData(String key, value) async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      localStorage.setString(key, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static storeDataBool(String key, value) async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      localStorage.setBool(key, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getDataBool(String key) async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      var value = localStorage.getBool(key);
      return value;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static storeStringList(String key, value) async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      localStorage.setStringList(key, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getStringList(String key) async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      var value = localStorage.getStringList(key);
      return value;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static removeStore(String key) async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      localStorage.remove(key);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
