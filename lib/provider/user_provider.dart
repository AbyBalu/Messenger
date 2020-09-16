import 'package:flutter/widgets.dart';
import 'package:greenlight_messenger/models/user.dart';
import 'package:greenlight_messenger/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User _user;
  AuthMethods _authMethods = AuthMethods();

  User get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

}
