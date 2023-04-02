import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'PG 6',
      description: 'The 6th product of the PG series.',
      price: 79.99,
      imageUrl:
          'https://sneakernews.com/wp-content/uploads/2022/06/nike-pg-6-do9823-100-release-date-6.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Kyrie 7',
      description: 'The 7th product of the Kyrie shoes series.',
      price: 59.99,
      imageUrl:
          'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61SbR8yYQDL._AC_UY1000_.jpg',
    ),
    Product(
      id: 'p3',
      title: 'WH-1000XM5',
      description: 'Sony\'s latest flagship noise-canceling headphones.',
      price: 349.99,
      imageUrl:
          'https://www.sony.co.kr/image/6145c1d32e6ac8e63a46c912dc33c5bb?fmt=pjpeg&wid=330&bgcolor=FFFFFF&bgc=FFFFFF',
    ),
    Product(
      id: 'p4',
      title: 'FC660m',
      description: 'Leopold\'s coral-blue bluetooth keyboard.',
      price: 99.99,
      imageUrl:
          'https://mblogthumb-phinf.pstatic.net/MjAyMjA5MTdfMjE4/MDAxNjYzNDEzNDU2MjUz._uOwJcSBPlPO-kBxiqzKLazRDewn4shBsgxEfeMp8lEg.A1pXTdyfcAdVFISr3EOPL9gMGP96Oy1woqFPtexpnRcg.PNG.kharselian/DSC_2577.png?type=w800',
    ),
  ]; // refers to pointer

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favotieItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String productId) {
    return _items.firstWhere((prodItem) => prodItem.id == productId);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: const Uuid().v4(),
      imageUrl: product.imageUrl,
      price: product.price,
      title: product.title,
      description: product.description,
      isFavorite: product.isFavorite,
    );
    _items.add(newProduct);

    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print("wut");
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);

    notifyListeners();
  }
}
