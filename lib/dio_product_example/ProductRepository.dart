import 'package:dio/dio.dart';
import 'package:flutter_practice/dio_product_example/ApiService.dart';
import 'package:flutter_practice/dio_product_example/ProductsList.dart';

class ProductRepositry {
  final _apiService = ApiService();

  Future<ProductsList> getAllProducts() async {
    try {
      final result = await _apiService.client.get("/products");

      return ProductsList.fromJson(result.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (error) {
      throw Exception("Failed to load products: $error");
    }
  }


}
