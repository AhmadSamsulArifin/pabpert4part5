import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String _search = '';
  String _selectedCategory = 'All';

  late final List<Product> _products = [
    Product(
      id: '1',
      name: 'Laptop Gaming',
      price: 15000000,
      emoji: '💻',
      description: 'Laptop gaming performa tinggi',
      category: 'Electronics',
    ),
    Product(
      id: '2',
      name: 'Smartphone Pro',
      price: 8000000,
      emoji: '📱',
      description: 'Smartphone flagship terbaru',
      category: 'Electronics',
    ),
    Product(
      id: '3',
      name: 'Wireless Headphones',
      price: 1500000,
      emoji: '🎧',
      description: 'Headphones noise-cancelling',
      category: 'Accessories',
    ),
    Product(
      id: '4',
      name: 'Smart Watch',
      price: 3000000,
      emoji: '⌚',
      description: 'Smartwatch dengan health tracking',
      category: 'Accessories',
    ),
    Product(
      id: '5',
      name: 'Camera DSLR',
      price: 12000000,
      emoji: '📷',
      description: 'Kamera DSLR profesional',
      category: 'Electronics',
    ),
    Product(
      id: '6',
      name: 'Tablet Pro',
      price: 7000000,
      emoji: '📟',
      description: 'Tablet untuk produktivitas',
      category: 'Electronics',
    ),
  ];

  List<String> get _categories {
    final set = _products.map((p) => p.category).toSet().toList()..sort();
    return ['All', ...set];
  }

  List<Product> get _filteredProducts {
    final q = _search.trim().toLowerCase();
    return _products.where((p) {
      final matchSearch = q.isEmpty || p.name.toLowerCase().contains(q);
      final matchCategory =
          _selectedCategory == 'All' || p.category == _selectedCategory;
      return matchSearch && matchCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final products = _filteredProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartPage()),
                      );
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cart.itemCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // ✅ Search + Category Filter
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search product by name...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    isDense: true,
                  ),
                  onChanged: (val) => setState(() => _search = val),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text('Category: '),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _selectedCategory,
                        items: _categories
                            .map(
                              (c) => DropdownMenuItem(
                                value: c,
                                child: Text(c),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          if (val == null) return;
                          setState(() => _selectedCategory = val);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: products.isEmpty
                ? const Center(child: Text('No products found'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.deepPurple.shade50,
                                child: Center(
                                  child: Text(
                                    product.emoji,
                                    style: const TextStyle(fontSize: 64),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(
                                    product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    product.category,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Rp ${product.price.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        context.read<CartModel>().addItem(product);

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                '${product.name} ditambahkan ke cart!'),
                                            duration: const Duration(seconds: 1),
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.add_shopping_cart, size: 16),
                                      label: const Text('Add',
                                          style: TextStyle(fontSize: 12)),
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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