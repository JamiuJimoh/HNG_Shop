import 'package:flutter/material.dart';

import 'cart_controller.dart';
import 'colors.dart';
import 'constants.dart';
import 'order_summary.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: commonPaddingHV,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Order Confirmed',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 10.0),
            const Icon(
              Icons.check_circle,
              color: kPrimaryColor2,
              size: 180.0,
            ),
            const SizedBox(height: 10.0),
            Text(
              'Thanks for shopping with us!\n We are processing your order for delivery.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Summary',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                OrderSummary(
                  lastChild: ElevatedButton(
                    onPressed: () {
                      final provider = CartProvider.of(context)!;
                      provider.controller.clear();
                      Navigator.of(context).pop();
                      // Navigator.of(context).popUntil(
                      // ModalRoute.withName('/home'),
                      // );
                    },
                    child: const Text('Go back home'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
