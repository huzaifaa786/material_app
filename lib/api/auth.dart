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

  // static getuser() async {
  //   LoadingHelper.show();
  //   var url = BASE_URL + 'user/get';
  //   var data;
  //   final prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString('api_token'));
  //   data = {'api_token': prefs.getString('api_token')!};

  //   var response = await Api.execute(url: url, data: data);
  //   LoadingHelper.dismiss();
  //   if (!response['error']) {
  //     User? user = User(response['user']);
  //     print(user);
  //     return user;
  //   } else {
  //     Fluttertoast.showToast(msg: response['error_data']);
  //     return false;
  //   }
  // }

  // static changeposward(password, newPassword) async {
  //   LoadingHelper.show();
  //   final prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString('api_token'));
  //   var url = BASE_URL + 'changepasworduser';
  //   var data;
  //   data = {
  //     'api_token': prefs.getString('api_token'),
  //     'password': password.text,
  //     'newpassword': newPassword.text
  //   };

  //   var response = await Api.execute(url: url, data: data);

  //   LoadingHelper.dismiss();
  //   if (response['error'] == false) {
  //     return true;
  //   } else {
  //     Fluttertoast.showToast(msg: response['error']);
  //     return false;
  //   }
  // }

  // static getorder() async {
  //   LoadingHelper.show();
  //   var url = BASE_URL + 'getuserorder';
  //   var data;
  //   final prefs = await SharedPreferences.getInstance();
  //   print('object');
  //   print(prefs.getString('user_id'));
  //   data = {'id': prefs.getString('user_id')!};

  //   var response = await Api.execute(url: url, data: data);
  //   LoadingHelper.dismiss();
  //   if (!response['error']) {
  //     List<OrderModal> orders = <OrderModal>[];
  //     for (var order in response['orders']) {
  //       orders.add(OrderModal(order));
  //     }
  //     return orders;
  //   } else {
  //     Fluttertoast.showToast(msg: response['error_data']);
  //     return false;
  //   }
  // }

  static Future logout() async {
    SharedPreferencesHelper.remove('api_token');
  }
}
