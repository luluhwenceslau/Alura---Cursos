import 'dart:convert';
import 'package:api_project/models/journal.dart';
import 'package:api_project/services/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

//TODO: Arrumar para aparecer as tarefas na tela

class JournalService {
  static const String url = "http://10.253.33.1:3000/";
  static const String resource = "journals/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal, String  token) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(
      Uri.parse(getUrl()),
      headers: {'Content-type': 'application/json, Authorization": "Bearer $token,'},
      body: jsonJournal,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> edit(String id, Journal journal, String token) async {
    String jsonJournal = json.encode(journal.toMap());

    http.Response response = await client.put(
      Uri.parse("${getUrl()}$id"),
      headers: {'Content-type': 'application/json, Authorization": "Bearer $token'},
      body: jsonJournal,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<Journal>> getAll(
      {required String id, required String token}) async {
    http.Response response = await client.get(
        Uri.parse("${url}users/$id/journals"),
        headers: {"Authorization": "Bearer $token"});
        
    if (response.statusCode != 200) {
      throw Exception();
    }

    List<Journal> list = [];
    List<dynamic> listDynamic = json.decode(response.body);

    for (var jsonMap in listDynamic) {
      list.add(Journal.fromMap(jsonMap));
    }

    return list;
  }

  Future<bool> delete(String id, String token) async {
    http.Response response = await http.delete(Uri.parse("${getUrl()}$id"),
    headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
