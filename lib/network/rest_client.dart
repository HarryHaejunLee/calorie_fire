

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

const String serviceKey = '5AcFBB7lXMyjeTTvYz%2FJ9fWsY85jNukFBLzs%2BK%2FQXVojbcEUBwcf6pTTs9q95vXeUxqDsjUqnkpBahrhR63qlQ%3D%3D';

@RestApi(baseUrl: "https://apis.data.go.kr")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1')
  Future<String> getFoodList(@Query(serviceKey) String serviceKey,
      @Query('desc_kor') String descKor, @Query('pageNo') int pageNo, @Query('numOfRows') int numOfRows);
}