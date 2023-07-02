// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings, avoid_print, prefer_typing_uninitialized_variables

import 'package:fluttertoast/fluttertoast.dart';
import 'package:material/api/api.dart';
import 'package:material/helpers/loading.dart';
import 'package:material/helpers/shared_pref.dart';
import 'package:material/model/User.dart';
import 'package:material/values/url.dart';

class AuthApi {
  static login(email, password) async {
    LoadingHelper.show();
    var url = BASE_URL + 'user/login';
    var data = {
      'email': email,
      'password': password,
    };

    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['user']);
      SharedPreferencesHelper.setString('api_token', user.apiToken!);
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static register(name, email, password) async {
    LoadingHelper.show();
    var url = BASE_URL + 'register';
    var data;
    data = {
      'name': name,
      'email': email,
      'password': password,
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['user']);
      SharedPreferencesHelper.setString('api_token', user.apiToken!);
      return true;
    } else {
      print('error');
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
  static Future logout() async {
    SharedPreferencesHelper.remove('api_token');
  }
}
