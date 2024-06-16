// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:api_project/services/http_interceptor.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String url = "http://192.168.15.27:3000/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  Future<bool> login({required String email, required String password}) async {
    http.Response response = await client.post(
      Uri.parse('${url}login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode != 200) {
      String content = json.decode(response.body);

      switch (content) {
        case "Cannot find user":
          throw UserNotFindException();
      }
      throw HttpException(response.body);
    }

    saveUsersInfos(response.body);

    return true;
  }

  Future<void> register({required String password, required String email}) async {
    http.Response response = await client.post(
      Uri.parse('${url}register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode != 201) {
      throw HttpException(response.body);
    }

    saveUsersInfos(response.body);
  }

  saveUsersInfos(String body) async {
    Map<String, dynamic> map = json.decode(body);

    String token = map["accessToken"];
    String email = map["user"]["email"];
    int id = map["user"]["id"];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", token);
    prefs.setString("email", email);
    prefs.setInt("id", id);

    String? tokenSalvo = prefs.getString("accessToken");
    print(tokenSalvo);
  }
}

class UserNotFindException implements Exception {}
