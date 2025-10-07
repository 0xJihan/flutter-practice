import 'package:flutter/material.dart';
import 'package:flutter_practice/dio_product_example/ProductDetailPage.dart';
import 'package:flutter_practice/dio_product_example/ProductRepository.dart';
import 'package:flutter_practice/dio_product_example/ProductsList.dart';


class Productslistpage extends StatefulWidget {
  const Productslistpage({super.key});

  @override
  State<Productslistpage> createState() => _ProductslistpageState();
}

class _ProductslistpageState extends State<Productslistpage> {
  final repository = ProductRepositry();
  late Future<ProductsList> productList;

  @override
  void initState() {
    super.initState();
    productList = repository.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;



    int crossAxisCount = screenWidth < 600
        ? 2
        : screenWidth < 900
        ? 3
        : 4;

    return Scaffold(
      body: FutureBuilder(
        future: productList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red, fontSize: 17),
              ),
            );
          }

          final products = snapshot.data!.products ?? [];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(product: products[index]),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}



class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onClick});

  final Products product;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    final imageHeight = screenWidth < 600 ? 140.0 : 180.0;
    final titleFontSize = screenWidth < 600 ? 14.0 : 18.0;
    final priceFontSize = screenWidth < 600 ? 13.0 : 16.0;
    final descFontSize = screenWidth < 600 ? 12.0 : 14.0;

    return GestureDetector(
      onTap: onClick,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.id.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.images?.isNotEmpty == true
                        ? product.images!.first
                        : product.thumbnail ?? '',
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Text(
                product.title ?? "No Title",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),

              Row(
                children: [
                  Text(
                    "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
                    style: TextStyle(
                      fontSize: priceFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  if (product.discountPercentage != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${product.discountPercentage!.toStringAsFixed(0)}% OFF",
                        style: TextStyle(
                          fontSize: priceFontSize - 2,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 5),

              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber[600], size: 18),
                  const SizedBox(width: 4),
                  Text(
                    product.rating?.toStringAsFixed(1) ?? '0.0',
                    style: TextStyle(fontSize: priceFontSize - 2),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      "(${product.reviews?.length ?? 0} reviews)",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: priceFontSize - 4,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              if (product.description != null)
                Text(
                  product.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: descFontSize,
                    color: Colors.grey[700],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}



