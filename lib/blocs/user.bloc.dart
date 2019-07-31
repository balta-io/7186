import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/models/authenticate-user.model.dart';
import 'package:shopping/models/create-user.model.dart';
import 'package:shopping/models/user.model.dart';
import 'package:shopping/repositories/account.repository.dart';

import '../settings.dart';

class UserBloc extends ChangeNotifier {
  var user = new UserModel();

  UserBloc() {
    user = null;
    loadUser();
  }

  Future<UserModel> authenticate(AuthenticateModel model) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var repository = new AccountRepository();

      var res = await repository.authenticate(model);

      user = res;
      await prefs.setString('user', jsonEncode(res));

      return res;
    } catch (ex) {
      print(ex);
      user = null;
      return null;
    }
  }

  Future<UserModel> create(CreateUserModel model) async {
    try {
      var repository = new AccountRepository();
      var res = await repository.create(model);
      return res;
    } catch (ex) {
      print(ex);
      user = null;
      return null;
    }
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);
    user = null;
    notifyListeners();
  }

  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var res = UserModel.fromJson(jsonDecode(userData));
      Settings.user = res;
      user = res;
    }
  }
}
