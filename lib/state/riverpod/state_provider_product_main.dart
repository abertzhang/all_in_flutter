import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(
      child: MaterialApp(home: HomePage()),
    ));

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          DropdownButton<ProductType>(
              value: ProductType.price,
              items: const [
                DropdownMenuItem(
                  value: ProductType.name,
                  child: Icon(Icons.sort_by_alpha, color: Colors.blue),
                ),
                DropdownMenuItem(
                  value: ProductType.price,
                  child: Icon(Icons.sort, color: Colors.blue),
                ),
              ],
              onChanged: (val) {
                ref.read(productSortTypeProvider.notifier).state = val!;
              })
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, idx) {
          final product = products[idx];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price}\$'),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  Product({required this.name, required this.price});
}

final productList = [
  Product(name: 'iphone', price: 99.36),
  Product(name: 'cookie', price: 2),
  Product(name: 'android', price: 19.3),
];
final productSortTypeProvider = StateProvider<ProductType>((ref) => ProductType.name);

final productsProvider = Provider<List<Product>>((ref) {
  final sortType = ref.watch(productSortTypeProvider);
  switch (sortType) {
    case ProductType.name:
      return productList;
    case ProductType.price:
      return [Product(name: 'iphone', price: 99.36)];
  }
});

enum ProductType { name, price }
