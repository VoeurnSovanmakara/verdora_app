import 'package:flutter/material.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/src/title_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: CartPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const CartView();
  }
}

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(
        title: 'My Cart',
        showBackButton: false,
        elevation: 0,
      ),
      body: Center(
        child: Text('Cart Page'),
      ),
    );
  }
}
