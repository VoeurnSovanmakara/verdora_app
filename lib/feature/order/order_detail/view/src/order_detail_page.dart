import 'package:flutter/material.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/feature/order/order_detail/widgets/invoice.dart';
import 'package:verdora_app/feature/order/order_detail/widgets/order_cancel.dart';
import 'package:verdora_app/feature/order/order_detail/widgets/order_product_list.dart';
import 'package:verdora_app/feature/order/order_detail/widgets/tracking_order.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: OrderDetailPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const OrderDetailView();
  }
}

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({super.key});

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Order Detail'),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.normal),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TrackingOrder(),
              const SizedBox(height: Spacing.l),
              const OrderProductList(),
              const SizedBox(height: Spacing.l),
              const Invoice(),
              const SizedBox(height: Spacing.l),
              const OrderCancel(),
              Container(
                height: MediaQuery.viewPaddingOf(
                  context,
                ).bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
