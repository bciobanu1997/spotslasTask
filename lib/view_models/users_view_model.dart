import 'package:flutter/material.dart';
import 'package:spotlastask/model/api_status.dart';
import 'package:spotlastask/model/user_error.dart';
import 'package:spotlastask/model/user_services.dart';
import 'package:spotlastask/model/users_list_model.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is ConnectionSuccess) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is ConnectionFailure) {
      UserError userError = UserError(
          code: response.code, message: response.errorResponse as String);
      setUserError(userError);
    }
    setLoading(false);
  }
}
