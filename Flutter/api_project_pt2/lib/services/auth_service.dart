import 'dart:convert';
import 'dart:io';
import 'package:api_project/services/web_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String url = WebClient.url;
  http.Client client = WebClient().client;

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

  Future<bool> register(
      {required String password, required String email}) async {
    http.Response response = await client.post(
      Uri.parse('${url}register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode != 201) {
      throw HttpException(response.body);
    }

    saveUsersInfos(response.body);
    return true;
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
  }
}

class UserNotFindException implements Exception {}
