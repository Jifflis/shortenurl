import 'dart:convert';

import 'package:flutter_app/model/failure.dart';
import 'package:flutter_app/repository/api.dart';
import 'package:http/http.dart' as http;

class MainRepository {
  Api _api = Api();

  ///generate shortlink
  ///
  ///
  Future<String> generate(String longUrl, String name) async {
    String url = '${_api.endpoint}'
        '${_api.key}'
        '${_api.short}'
        '$longUrl'
        '${_api.name}'
        '$name';

    http.Response response = await _api.get(url);

    Map<String, dynamic> map = jsonDecode(response.body);
    _validate(map['url']['status']);
    return map['url']['shortLink'];
  }

  ///validate response
  ///refer to https://cutt.ly/api-documentation/cuttly-links-api
  ///
  String _validate(int status) {
    switch (status) {
      case 1:
        throw Failure(
            'the shortened link comes from the domain that shortens the link, i.e. the link has already been shortened');
      case 2:
        throw Failure('the entered link is not a link');
      case 3:
        throw Failure('the preferred link name is already taken');
      case 4:
        throw Failure('Invalid API key');
      case 5:
        throw Failure(
            'the link has not passed the validation. Includes invalid characters');
      case 6:
        throw Failure('The link provided is from a blocked domain');
    }
  }
}
