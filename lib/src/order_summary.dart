import 'package:flutter/material.dart';

import 'cart_controller.dart';
import 'text_tile.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.lastChild});
  final Widget lastChild;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context)!;

    return ListenableBuilder(
      listenable: provider.controller,
      builder: (_, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextTile(
                leftText: 'Subtotal',
                rightText: provider.controller.subtotalCost),
            const SizedBox(height: 10.0),
            TextTile(
                leftText: 'Shipping Cost',
                rightText: '\$${provider.controller.shippingCost}'),
            const SizedBox(height: 10.0),
            TextTile(
                leftText: 'Total', rightText: provider.controller.totalCost),
            const SizedBox(height: 20.0),
            lastChild,
          ],
        );
      },
    );
  }
}
