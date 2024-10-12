import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  // Example list of products
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Wireless Headphones',
      'price': 59.99,
      'image': 'assets/headphones.png',
    },
    {
      'name': 'Smart Watch',
      'price': 99.99,
      'image': 'assets/smart_watch.png',
    },
    {
      'name': 'Bluetooth Speaker',
      'price': 45.00,
      'image': 'assets/speaker.png',
    },
    {
      'name': 'Running Shoes',
      'price': 120.00,
      'image': 'assets/shoes.png',
    },
    // Add more products here
  ];

  // Function to handle adding items to the cart
  void _addToCart(String productName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$productName added to cart!')),
    );
  }

  // Function to view product details
  void _viewProductDetails(String productName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Viewing details for $productName')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final product = _products[index];
            return _buildProductCard(
              product['name'],
              product['price'],
              product['image'],
            );
          },
        ),
      ),
    );
  }

  // Widget to build each product card
  Widget _buildProductCard(String name, double price, String image) {
    return GestureDetector(
      onTap: () => _viewProductDetails(name), // Handle product tap
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product Image
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),

            // Product Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            // Product Price
            Text(
              '\$$price',
              style: TextStyle(
                color: Colors.green,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _addToCart(name),
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
