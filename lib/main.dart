import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String nama;
  final String imageUrl;
  final String desc;
  final double harga;

  Product(this.nama, this.imageUrl, this.desc, this.harga);
}

final List<Product> products = [
  Product('Nike Bomba 1', 'assets/images/sepatu2.png',
      'Explode your Style like a BOMB!', 100.0),
  Product('Nike Speeds', 'assets/images/sepatu1.png',
      'Fast, Nimble, Become the Wind!', 80.0),
  Product('Nike Sports VXI', 'assets/images/sepatu2.png',
      'Agility Is my Middle Name!', 120.0),
  Product('Nike Sports VXII', 'assets/images/sepatu1.png',
      'Agility Is my First Name!', 120.0),
  Product('Nike Sports VXIII', 'assets/images/sepatu1.png',
      'Agility Is my Last Name!', 120.0),
  Product('Nike Sports VXIIII', 'assets/images/sepatu2.png',
      'Agility Is my Full Name!', 120.0),
];

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key});

  final List<Color> colors = [
    Colors.amber[100]!,
    Colors.grey[300]!,
    Colors.blue[100]!,
    Colors.lime[100]!,
    Colors.red[100]!,
    Colors.yellow[100]!
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Text(
                  'Shoes',
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/crown-10716.png'),
                  radius: 24.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.nama,
                                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold )),
                            const SizedBox(height: 20.0),
                            Text(product.desc),
                            const SizedBox(height: 60.0),
                            Text('\$${product.harga}',
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.network(product.imageUrl,
                          width: 150.0, height: 150.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
