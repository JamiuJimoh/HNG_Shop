import 'package:flutter/material.dart';

import 'src/cart_controller.dart';
import 'src/home_page.dart';
import 'src/order_success_page.dart';
import 'src/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CartProvider(
      controller: CartController(),
      child: MaterialApp(
        title: 'Shop',
        theme: AppTheme.lightTheme,
        home: const HomePage(),
        routes: {
          '/home': (_) => const HomePage(),
          '/order-success': (_) => const OrderSuccessPage(),
        },
      ),
    );
  }
}
