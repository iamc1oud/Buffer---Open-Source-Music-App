import 'package:buffer/core/networking/dio_logger.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final _dio = Dio()..interceptors.add(Logging());

  final _baseUrl = 'https://saavn.me';

  Future<dynamic> get(
    String? path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response =
        await _dio.get('$_baseUrl$path', queryParameters: queryParameters);

    return response.data;
  }
}
