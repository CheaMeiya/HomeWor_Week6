
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Product {
  final String name;
  final String description;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ex3(),
    );
  }
}

class Ex3 extends StatelessWidget {
  const Ex3({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: 'Dart',
        description: 'the best object language',
        imageUrl: 'assets/ex3/dart.png',
      ),
      Product(
        name: 'Flutter',
        description: 'the best mobile widget library',
        imageUrl: 'assets/ex3/flutter.png',
      ),
      Product(
        name: 'Firebase',
        description: 'the best cloud database',
        imageUrl: 'assets/ex3/firebase.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(fontSize: 14),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(10),

        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductWidget(
              product: products[index],
            );
          },
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imageUrl,
              width: 42,
              height: 42,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 42,
                  height: 42,
                  child: Icon(Icons.image_not_supported),
                );
              },
            ),

            const SizedBox(height: 3),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),

            Text(
              product.description,
              style: const TextStyle(
                fontSize: 8,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
