import 'package:dio/dio.dart';
import 'package:learn_more_about_request/services/json_placeholder/interface/http_client_interface.dart';
import 'package:learn_more_about_request/services/json_placeholder/models/todos_model.dart';

class ClientDio implements HttpClientInterface {
  Dio dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    var response = await dio.get(url);
    return response;
  }
}
