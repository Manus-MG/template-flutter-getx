import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../core/errors/exceptions.dart';

abstract class BaseApiServices {
  Future<dynamic> getApi(String url, String token);
  Future<dynamic> postApi(dynamic data, String url, String token);
  Future<dynamic> postApiEncoded(dynamic data, String url, String token);
}

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url, String token) async {
    if (kDebugMode) {
      print(url);
    }

    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      final response = await http
          .get(Uri.parse(url), headers: requestHeaders)
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        print("Raw API Response: ${responseJson}");
        return responseJson;
      } else {
        // Handle non-200 responses
        throw HttpException(
            'Failed to load data, status code: ${response.statusCode}');
      }
    } on SocketException {
      throw InternetException('No Internet connection');
    } on TimeoutException {
      throw TimeoutException('The connection has timed out, please try again');
    } on FormatException {
      throw FormatException('Invalid response format');
    }
  }

  @override
  Future<dynamic> postApi(var data, String url, String token) async {
    // TODO: implement getApi

    try {
      Map<String, String> requestHeaders = {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Authorization": "Bearer $token",
      };
      if (kDebugMode) {
        print(url);
        print(jsonEncode(data));
        print(requestHeaders);
      }
      final response = await http
          .post(
            Uri.parse(url),
            headers: requestHeaders,
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      print(response.body);
      return json.decode(response.body);
    } on SocketException {
      throw InternetException();
    } on RequestTimeoutException {
      throw RequestTimeoutException();
    }
  }

  Future<dynamic> putApi(var data, String url, String token) async {
    try {
      Map<String, String> requestHeaders = {
        "Content-Type": "application/json; charset=utf-8",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };

      if (kDebugMode) {
        print(url);
        print(jsonEncode(data));
        print(requestHeaders);
      }

      final response = await http
          .put(
            Uri.parse(url),
            headers: requestHeaders,
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));

      print(response.body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "PUT request failed with status code: ${response.statusCode}");
      }
    } on SocketException {
      throw InternetException();
    } on RequestTimeoutException {
      throw RequestTimeoutException();
    } catch (error) {
      throw Exception("PUT request failed: $error");
    }
  }

  @override
  Future postApiEncoded(data, String url, String token) async {
    // TODO: implement getApi

    if (kDebugMode) {
      print(url);
      print(data);
    }

    try {
      Map<String, String> requestHeaders = {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };
      final response = await http
          .post(
            Uri.parse(url),
            headers: requestHeaders,
            body: data,
          )
          .timeout(const Duration(seconds: 10));
      return jsonDecode(response.body);
    } on SocketException {
      throw InternetException();
    } on RequestTimeoutException {
      throw RequestTimeoutException();
    }
  }
}
