import 'package:dio/dio.dart';
import 'package:grisoft/core/constant/service_constants.dart';

class ShortenService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ServiceConstants.instance.baseUrl,
  ));

  Future shortenLink(String link) async {
    try {
      var response = await _dio.get(ServiceConstants.instance.endPoint + link);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
