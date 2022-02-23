import 'package:dio/dio.dart';
import 'package:learn_more_about_request/services/json_placeholder/interface/http_client_interface.dart';
import 'models/todos_model.dart';

const url = "https://jsonplaceholder.typicode.com/todos";

class JsonPlaceholderService {
  final HttpClientInterface client;

  JsonPlaceholderService(this.client);

  Future<List<Todos>> getTodos() async {
    var response = await client.get(url);
    var body = (response.data as List);
    List<Todos> listTodos = body.map((item) {
      return Todos.fromJson(item);
    }).toList();
    return listTodos;
  }
}
