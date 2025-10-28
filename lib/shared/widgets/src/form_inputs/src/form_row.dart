import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class FormRow extends StatelessWidget {
  const FormRow({
    required this.children,
    super.key,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .mapIndexed(
            (index, e) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: index != children.length - 1 ? 16 : 0,
                ),
                child: e,
              ),
            ),
          )
          .toList(),
    );
  }
}
