import 'package:flutter/material.dart';
import 'package:flutter_practice/domain/utils.dart';



class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  final List<Map<String, String>> products = const [
    {
      "id": "1",
      "name": "Smart Watch",
    },
    {
      "id": "2",
      "name": "Headphones",
    },
    {
      "id": "3",
      "name": "Camera",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(product: product),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Column(
                children: [

                  Hero(
                    tag: product['id']!,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                       randomImage,
                        fit: BoxFit.cover,
                        height: 130,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product['name']!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class ProductDetailsPage extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name']!)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Hero(
            tag: product['id']!,
            child: Image.network(
              randomImage,
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              product['name']!,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "This is a detailed description of the product. "
                  "You can showcase features, price, reviews, etc.",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
