import 'dart:convert';
import 'package:api_project/models/journal.dart';
import 'package:api_project/services/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class JournalService {
  static const String url = "http://10.253.34.96:3000/";
  static const String resource = "journals/";

  http.Client client = InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

   Future<bool> register(Journal journal) async{
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(
      Uri.parse(getUrl()),
        headers: {'Content-type' : 'application/json'},
        body: jsonJournal,
    );
    if (response.statusCode == 201){
      return true;
      }
    return false;
  }

  Future <List<Journal>> getAll() async{
    http.Response response = await client.get(
        Uri.parse(getUrl()));
    if(response.statusCode != 200){
      throw Exception();
    }

    List<Journal> list = [];
    List<dynamic> listDynamic = json.decode(response.body);

    for(var jsonMap in listDynamic){
      list.add(Journal.fromMap(jsonMap));
    }

    return list;
  }
}

