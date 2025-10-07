import 'package:dio/dio.dart';

class ApiService{

  late Dio dio;

  ApiService(){
    dio = Dio(BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com",
        headers: {
          'Content-Type':'application/json'
        }
    ));

  }






}