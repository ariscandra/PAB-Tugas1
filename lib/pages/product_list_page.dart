import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/product.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

final List<Product> _allProducts = [
  Product(
    id: '1',
    name: 'Laptop Gaming',
    price: 15000000,
    emoji: '💻',
    description: 'Laptop gaming performa tinggi',
    category: 'Elektronik',
    imagePath: 'assets/images/laptop.jpg',
  ),
  Product(
    id: '2',
    name: 'Smartphone Pro',
    price: 8000000,
    emoji: '📱',
    description: 'Smartphone flagship terbaru',
    category: 'Gadget',
    imagePath: 'assets/images/smartphone.jpg',
  ),
  Product(
    id: '3',
    name: 'Wireless Headphones',
    price: 1500000,
    emoji: '🎧',
    description: 'Headphones noise-cancelling',
    category: 'Aksesoris',
    imagePath: 'assets/images/headphones.jpg',
  ),
  Product(
    id: '4',
    name: 'Smart Watch',
    price: 3000000,
    emoji: '⌚',
    description: 'Smartwatch dengan health tracking',
    category: 'Gadget',
    imagePath: 'assets/images/smartwatch.jpg',
  ),
  Product(
    id: '5',
    name: 'Camera DSLR',
    price: 12000000,
    emoji: '📷',
    description: 'Kamera DSLR profesional',
    category: 'Elektronik',
    imagePath: 'assets/images/camera.jpg',
  ),
  Product(
    id: '6',
    name: 'Tablet Pro',
    price: 7000000,
    emoji: '📟',
    description: 'Tablet untuk produktivitas',
    category: 'Elektronik',
    imagePath: 'assets/images/tablet.jpg',
  ),
];

const String _categoryAll = 'Semua';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = _categoryAll;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> get _filteredProducts {
    var list = _allProducts;
    final query = _searchController.text.trim().toLowerCase();
    if (query.isNotEmpty) {
      list = list.where((p) => p.name.toLowerCase().contains(query)).toList();
    }
    if (_selectedCategory != _categoryAll) {
      list = list.where((p) => p.category == _selectedCategory).toList();
    }
    return list;
  }

  static List<String> get _categories {
    final cats = _allProducts.map((p) => p.category).toSet().toList()..sort();
    return [_categoryAll, ...cats];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk'),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: AppColors.cartBadgeBg,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${cart.itemCount}',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Cari produk...',
                hintStyle: GoogleFonts.inter(color: AppColors.textSecondary),
                prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _categories.map((cat) {
                  final isSelected = _selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => setState(() => _selectedCategory = cat),
                        borderRadius: BorderRadius.circular(20),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primaryLight : AppColors.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected ? AppColors.primary.withOpacity(0.4) : AppColors.divider,
                              width: isSelected ? 1.5 : 1,
                            ),
                            boxShadow: const [],
                          ),
                          child: Text(
                            cat,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                              color: isSelected ? AppColors.primary : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: _filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      'Tidak ada produk',
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.08,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0F000000),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: product.imagePath != null
                          ? Image.asset(
                              product.imagePath!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              errorBuilder: (_, __, ___) => Container(
                                color: AppColors.productCardBg,
                                child: Center(
                                  child: Text(
                                    product.emoji,
                                    style: const TextStyle(fontSize: 36),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              color: AppColors.productCardBg,
                              child: Center(
                                child: Text(
                                  product.emoji,
                                  style: const TextStyle(fontSize: 36),
                                ),
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 6, 6, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Rp ${product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                          style: GoogleFonts.inter(
                            color: AppColors.success,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<CartModel>().addItem(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${product.name} ditambahkan ke keranjang'),
                                  duration: const Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                            icon: const Icon(Icons.add_shopping_cart, size: 14),
                            label: const Text('Tambah', style: TextStyle(fontSize: 12)),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
