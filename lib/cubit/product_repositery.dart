import 'package:dio/dio.dart';
import 'package:elevate_challenge/data/product_model.dart';

class ProductsRepository {
  final Dio dio;

  ProductsRepository(this.dio);

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get("https://dummyjson.com/products");
    final data = response.data["products"] as List;
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}