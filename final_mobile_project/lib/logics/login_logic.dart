
import 'package:flutter/cupertino.dart';
import '../models/user_model.dart';

class LoginLogic extends ChangeNotifier{
  late UserModel _loggedInUser;
  UserModel get loggedInUser => _loggedInUser;

  void setLoggedInUser(UserModel userModel){
    _loggedInUser = userModel;
    notifyListeners();
  }

  String get fullName{
    return _loggedInUser.name;  //get from user_list
  }

}