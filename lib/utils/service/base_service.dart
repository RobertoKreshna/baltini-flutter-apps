import 'package:dio/dio.dart';

class BaseService {
  final Dio _dio = Dio();
  late Response<dynamic> _returnResponse;

  get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  }) async {
    final Response<dynamic> res = await _dio.get(
      '$url',
      queryParameters: params,
      options: Options(
        headers: {
          'X-Shopify-Access-Token': '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',
          ...headers ?? {}
        },
      ),
    );
    _returnResponse = res;
    return _returnResponse;
  }
}
