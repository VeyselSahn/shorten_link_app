import 'package:dio/dio.dart';
import 'package:grisoft/core/constant/service_constants.dart';
import 'package:grisoft/core/service/cache_service.dart';

class ShortenService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ServiceConstants.instance.baseUrl));

  Future shortenLink(String link) async {
    try {
      var response = await _dio.post(ServiceConstants.instance.endPoint, data: {"link": link});
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
