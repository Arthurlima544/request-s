import 'package:dio/dio.dart';
import 'package:learn_more_about_request/services/json_placeholder/interface/http_client_interface.dart';
import 'models/todos_model.dart';

const baseUrl = "https://jsonplaceholder.typicode.com";

class JsonPlaceholderService {
  final HttpClientInterface client;

  JsonPlaceholderService(this.client);

  Future<List<Todos>> getTodos() async {
    var response = await client.get("$baseUrl/todos");
    var body = (response.data as List);
    List<Todos> listTodos = body.map((item) {
      return Todos.fromJson(item);
    }).toList();
    return listTodos;
  }

  Future<Todos> postTodo(Todos todo) async {
    Response response = await client.post("$baseUrl/posts", todo.toJson());
    var newTodo = Todos.fromJson(response.data);
    return newTodo;
  }
}
