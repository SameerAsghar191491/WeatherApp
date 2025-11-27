import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/data/app_exceptions.dart';
import 'package:weatherapp_starter_project/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/data/status/api_response.dart';
import 'package:weatherapp_starter_project/utils/Utils.dart';

class NetworkApiServices implements BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    // dynamic jsonResponse;
    try {
      dynamic response = await http.get(Uri.parse(url));
      if (response == null) {
        throw FetchDataException("No Data");
      }
      return response = getJsonResponse(response);
    } on SocketException {
      ApiResponse.error("No Internet Connection");
      Utils.toastmessage("No Internet Connection");
    } catch (e) {
      debugPrint(e.toString());
      Utils.toastmessage(e.toString());
      throw FetchDataException(e.toString());
    }
  }

  @override
  Future<dynamic> getPostApiResponse(String url, data) async {
    // dynamic jsonResponse;
    try {
      dynamic response = await http.post(Uri.parse(url), body: data);
      return response = getJsonResponse(response);
    } catch (e) {
      Utils.toastmessage(e.toString());
    }
  }

  dynamic getJsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final jsonResponse = jsonDecode(response.body.toString());
        return jsonResponse;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 401:
        throw UnAuthorisedException(response.body.toString());
      default:
        throw FetchDataException(
          'Default Exception withStatusCode: ${response.statusCode.toInt()}',
        );
    }
  }
}
