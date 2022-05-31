import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:spotlastask/model/api_status.dart';
import 'package:spotlastask/model/users_list_model.dart';
import 'package:spotlastask/widgets/model_constants.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(ModelConstants.USERS_LIST);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return ConnectionSuccess(
            response: userListModelFromJson(response.body));
      }
      return ConnectionFailure(
          code: ModelConstants.USER_INVALID_RESPONSE,
          errorResponse: 'Invalid Response');
    } on HttpException {
      return ConnectionFailure(
          code: ModelConstants.NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return ConnectionFailure(
          code: ModelConstants.INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return ConnectionFailure(
          code: ModelConstants.UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
