import 'dart:collection';

import 'package:flutter/material.dart';

import 'plant.dart';

class CartController extends ChangeNotifier {
  final _cart = <Plant>[];

  UnmodifiableListView<Plant> get cart => UnmodifiableListView(_cart);

  bool inCart(Plant plant) => _cart.contains(plant);

  void add(Plant plant) {
    if (inCart(plant)) {
      remove(plant.id);
      return;
    }
    _cart.add(plant);
    notifyListeners();
  }

  void remove(String plantID) {
    _cart.removeWhere((plant) => plant.id == plantID);
    notifyListeners();
  }

  void clear() {
    _cart.clear();
    notifyListeners();
  }

  double get shippingCost => 10.0;

  double _subtotalCost() {
    try {
      return _cart
          .map((plant) => plant.price)
          .reduce((prev, next) => prev + next);
    } catch (_) {
      return 0.0;
    }
  }

  String get subtotalCost {
    return '\$${_subtotalCost().toStringAsFixed(2)}';
  }

  String get totalCost =>
      '\$${(_subtotalCost() + shippingCost).toStringAsFixed(2)}';
}

class CartProvider extends InheritedWidget {
  const CartProvider({
    super.key,
    required this.controller,
    required super.child,
  });
  final CartController controller;

  static CartProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CartProvider>();

  @override
  bool updateShouldNotify(covariant CartProvider oldWidget) =>
      controller != oldWidget.controller;
}
