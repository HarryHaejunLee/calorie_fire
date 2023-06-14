// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://apis.data.go.kr';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<String> getFoodList(
    String serviceKey,
    String descKor,
    int pageNo,
    int numOfRows,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'5AcFBB7lXMyjeTTvYz%2FJ9fWsY85jNukFBLzs%2BK%2FQXVojbcEUBwcf6pTTs9q95vXeUxqDsjUqnkpBahrhR63qlQ%3D%3D':
          serviceKey,
      r'desc_kor': descKor,
      r'pageNo': pageNo,
      r'numOfRows': numOfRows,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
