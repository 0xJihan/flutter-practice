import 'package:flutter/material.dart';
import 'ProductsList.dart';

class ProductDetailPage extends StatelessWidget {
  final Products product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? "Product Detail",style: TextStyle(
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 300,
              child: Hero(
                tag: product.id.toString(),
                child: PageView.builder(
                  itemCount: product.images?.length ?? 1,
                  itemBuilder: (context, index) {
                    final imageUrl = product.images != null && product.images!.isNotEmpty
                        ? product.images![index]
                        : product.thumbnail ?? '';
                    return Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                product.title ?? "",
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            if (product.category != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  product.category!,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ),

            const SizedBox(height: 8),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  if (product.discountPercentage != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${product.discountPercentage!.toStringAsFixed(0)}% OFF",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 8),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber[600], size: 20),
                  const SizedBox(width: 4),
                  Text(
                    product.rating?.toStringAsFixed(1) ?? '0.0',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "(${product.reviews?.length ?? 0} reviews)",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                product.description ?? "",
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),

            const SizedBox(height: 12),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Stock: ${product.stock ?? 0} | Status: ${product.availabilityStatus ?? 'N/A'}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 12),


            if ((product.tags?.isNotEmpty ?? false) || product.brand != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    if (product.brand != null)
                      Chip(
                        label: Text(product.brand!),
                        backgroundColor: Colors.deepPurple[50],
                      ),
                    if (product.tags != null)
                      ...product.tags!.map(
                            (tag) => Chip(
                          label: Text(tag),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                  ],
                ),
              ),

            const SizedBox(height: 24),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 18 , color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
