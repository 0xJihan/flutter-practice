import 'package:dio/dio.dart';

class ApiService{

  late Dio _dio;

  ApiService(){
    _dio = Dio(BaseOptions(
      baseUrl: "https://dummyjson.com",
      headers: {
        'Content-Type':'application/json'
      }
    ));


  }

  Dio get client => _dio;


}