import 'package:appentus_flutter/data/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class QSharedPreferences {

  static SharedPreferences? _sp;

  Future<SharedPreferences> get sp async{
    if (_sp != null) {
      return _sp!;
    }
    _sp = await init();
    return _sp!;
  }

  init() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }
  
  Future<String> getUser() async {
    var prefs = await sp;
    final user = prefs.getString('email');
    return user!;
  }

  void saveUser(String email) async {
    var prefs = await sp;
    prefs.setString('email', email);
  }

  Future<bool> hasUser() async {
    var prefs = await sp;
    final userDetails = prefs.getString('email');
    if(userDetails == null){
      return false;
    } else {
      return true;
    }
  }

  void clearUser() async {
    var prefs = await sp;
    prefs.remove('email');
  }
}