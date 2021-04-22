import 'dart:io';

import 'package:flutter_app/model/failure.dart';
import 'package:http/http.dart' as http;
class Api{

  final String endpoint = 'https://cutt.ly/api/api.php?';
  final String key = 'key=a207c85f877168bb9e8b85b27c04796b18d66&';
  final String short = 'short=';
  final String name = '&name=';

  ///http get request
  ///
  ///
  Future<http.Response> get(String url) async{
    print(url);
    try{
      return _response(await http.get(url));
    } on SocketException{
      throw Failure('No internet connection');
    }
  }

  ///validate responsecode
  ///
  ///
  http.Response _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw Failure('Bad request');
      case 401:
        throw Failure('Unauthorized request');
      case 403:
        throw Failure('Forbidden request');
      case 500:
        throw Failure('Internal error!');
      default:
        throw Failure(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}