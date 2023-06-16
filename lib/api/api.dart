// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';

class Api {
  static execute({url, data}) async {
    var result;

    Dio dio = Dio();

    result = await dio.post(url, data: data);
    print(result);
    var response = jsonDecode(result.toString());

    return response;
  }
}
