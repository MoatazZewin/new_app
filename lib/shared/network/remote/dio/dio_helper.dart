
import 'package:dio/dio.dart';

class DioHelper{

  static late Dio dio;

  static init()
  {
    dio = Dio(BaseOptions(
      baseUrl:"https://newsapi.org/",
    ));
  }
  static Future<Response> get(String path,Map<String,dynamic> query)async
  {
    return await dio.get(path,queryParameters: query);
  }

  
}