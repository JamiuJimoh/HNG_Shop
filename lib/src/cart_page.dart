import 'package:flutter/material.dart';

import 'cart_controller.dart';
import 'colors.dart';
import 'constants.dart';
import 'order_summary.dart';
import 'plant_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context)!;

    return ListenableBuilder(
      listenable: provider.controller,
      builder: (_, __) {
        final plants = provider.controller.cart;
        return switch (plants.isEmpty) {
          true => Center(
              child: Text(
                'Cart is Empty. Add Items to cart!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400, color: kSecondaryTextColor),
                textAlign: TextAlign.center,
              ),
            ),
          false => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Cart',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              body: Padding(
                padding: commonPaddingHV,
                child: ListView.builder(
                  itemCount: plants.length,
                  itemBuilder: (_, i) => Column(
                    children: [
                      PlantTileCart(plant: plants[i]),
                      if (i < plants.length - 1)
                        const SizedBox(height: 24.0)
                      else
                        const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
              bottomSheet: Container(
                color: Colors.white,
                padding: commonPaddingHV.copyWith(top: 5.0),
                child: OrderSummary(
                  lastChild: ElevatedButton(
                    onPressed: () async {
                      await Navigator.of(context).pushNamed('/order-success');
                      if (!context.mounted) return;
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                    child: const Text('Checkout'),
                  ),
                ),
              ),
            ),
        };
      },
    );
  }
}
