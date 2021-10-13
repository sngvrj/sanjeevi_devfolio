import 'dart:convert';
import 'package:http/http.dart';

import 'api_constants.dart';


class ApiClient {
  ApiClient(this._client);
  final Client _client;

  dynamic get(
    final String? url,
    Map<String, String>? headers,
    final dynamic Function(bool)? onError,
  ) async {
    final response = await _client.get(
      Uri.parse(url!),
      headers: {
        WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(
    final String? url,
    Map<String, String>? headers,
    Map<String, String>? params,
    final dynamic Function(bool)? onError,
  ) async {
    final response = await _client.post(
      Uri.parse(url!),
      body: params,
      headers: {
        WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

