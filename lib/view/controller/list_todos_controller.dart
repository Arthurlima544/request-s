import 'package:flutter/cupertino.dart';
import 'package:learn_more_about_request/services/json_placeholder/client/client_dio.dart';
import 'package:learn_more_about_request/services/json_placeholder/json_placeholder_service.dart';
import 'package:learn_more_about_request/services/json_placeholder/models/todos_model.dart';

class ListTodosController {
  final service = JsonPlaceholderService(ClientDio());
  Map<int, Todos> todos = {};
  ValueNotifier<List<Todos>> list = ValueNotifier([]);

  void getTodos() async {
    final aux = await service.getTodos();
    list.value = aux;
  }
}
