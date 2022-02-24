import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learn_more_about_request/services/json_placeholder/interface/http_client_interface.dart';

class ClientDio implements HttpClientInterface {
  Dio dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    var response = await dio.get(url);
    return response;
  }

  @override
  Future<dynamic> post(String url, dynamic body) async {
    var response = await dio.post(url,
        data: body,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8"
        }));
    return response;
  }

  @override
  Future<dynamic> put(String url, dynamic body) async {
    var response = await dio.put(url,
        data: body,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8"
        }));
    return response;
  }

  @override
  Future<dynamic> delete(String url) async {
    var response = await dio.delete(url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8"
        }));
    return response;
  }
}
