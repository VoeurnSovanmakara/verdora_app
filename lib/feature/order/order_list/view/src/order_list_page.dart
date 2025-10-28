import 'package:flutter/material.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/feature/order/order_list/widgets/src/order_item.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/src/title_app_bar.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: OrderListPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const OrderListView();
  }
}

class OrderListView extends StatefulWidget {
  const OrderListView({super.key});

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'My Orders',
        showBackButton: false,
        // elevation: 0,
      ),
      body: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.fromLTRB(
          Spacing.m, 
          Spacing.m, 
          Spacing.m, 
          150,
        ),
        separatorBuilder: (context, index) => const SizedBox(height: Spacing.s),
        itemBuilder: (context, index) {
          return const OrderItem();
        },
      ),
    );
  }
}
