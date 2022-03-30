import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grisoft/core/constant/service_constants.dart';
import 'package:grisoft/core/service/cache_service.dart';

class ShortenService {
  final Dio _dio = Dio(BaseOptions());

  Future shortenLink(String link) async {
    try {
      var serverAddress = await CacheService.instance.getServerAddress();
      var response = await _dio.post(serverAddress + ServiceConstants.instance.endPoint, data: {"link": link});
      return jsonDecode(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
