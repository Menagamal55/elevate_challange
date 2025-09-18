import 'package:elevate_challenge/data/product_model.dart';
import 'package:elevate_challenge/ui/widgets/proudect-card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          name: product.title,
          description: product.description,
          price: product.price,
          oldPrice: product.price + 20,
          rating: product.rating,
          imageUrl: product.thumbnail,
        );
      },
    );
  }
}