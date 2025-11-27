import 'package:flutter/material.dart';
import 'package:verdora_app/shared/widgets/src/app_bars/app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static MaterialPage<void> page({Key? key}) => MaterialPage<void>(
    child: NotificationPage(key: key),
  );

  @override
  Widget build(BuildContext context) {
    return const NotificationView();
  }
}

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: 'Notification',
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
