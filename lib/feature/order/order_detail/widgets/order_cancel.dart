import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';
import 'package:verdora_app/shared/widgets/src/buttons/src/custom_button.dart';
import 'package:verdora_app/shared/widgets/text_translate.dart';


class OrderCancel extends StatefulWidget {
  const OrderCancel({super.key});

  @override
  State<OrderCancel> createState() => _OrderCancelState();
}

class _OrderCancelState extends State<OrderCancel> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      // color: colors.pureWhite,
      padding: const EdgeInsets.only(
        // left: Spacing.normal,
        // right: Spacing.normal,
        bottom: Spacing.m,
      ),
      child: CustomButton(
        onPressed: () {
          // Todo: enable when backend ready
          showModalBottomSheet<Widget>(
            isScrollControlled: true, // Enables full-screen modal
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            backgroundColor: colors.neutral92,
            context: context,
            // builder: (modalContext) => BlocProvider.value(
            //   value: context.read<OrderDetailBloc>(),
            //   child: const CancelReasonModal(),
            // ),
            builder: (modalContext) => const CancelReasonModal(),
          );
        },
        title: 'Cancel Order',
      ),
    );
  }
}

class CancelReasonModal extends StatefulWidget {
  const CancelReasonModal({
    super.key,
  });

  @override
  State<CancelReasonModal> createState() => _CancelReasonModalState();
}

class _CancelReasonModalState extends State<CancelReasonModal> {
  final reasonData = <CancelReason>[
    CancelReason(
      id: 1,
      en: 'Merchant is taking too long',
      km: 'ហាងរៀបចំយូរពេក',
    ),
    CancelReason(id: 2, en: 'Wrong order', km: 'ទិញខុស/ច្រលំ'),
    CancelReason(id: 3, en: 'Wrong locations', km: 'ដាក់ទីតាំងខុស'),
    CancelReason(
      id: 4,
      en: 'Changed my mind',
      km: 'ប្តួរចិត្តព្រោះខ្ញុំសាវា',
    ),
    CancelReason(id: 5, en: 'Other reason', km: 'ហេតុផលផ្សេងៗទៀត'),
  ];
  CancelReason _selectedReason = CancelReason(id: 0, en: '', km: '');

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return FractionallySizedBox(
      heightFactor: 0.70,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Spacing.normal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    'Cancel Reason',
                    style: textTheme.titleLarge,
                  ),
                  CupertinoButton(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    child: Icon(Icons.close, color: colors.pureDark),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              height: 0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                  );
                },
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  vertical: Spacing.m,
                ),
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: reasonData.length,
                itemBuilder: (context, indext) {
                  return CupertinoButton(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.all(Spacing.m),
                    pressedOpacity: 0.8,
                    onPressed: () {
                      setState(() {
                        _selectedReason = reasonData[indext];
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextTranslate(
                          enText: reasonData[indext].en,
                          kmText: reasonData[indext].km,
                          style: textTheme.titleMedium,
                        ),
                        Icon(
                          _selectedReason.id == reasonData[indext].id
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: colors.primary,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.m,
              ),
              child: CustomButton(
                title: 'Confirm',
                // Todo: enable when backend ready
                // onPressed: _selectedReason.id == 0
                //     ? null
                //     : () {
                //         final orderId = context
                //             .read<OrderDetailBloc>()
                //             .state
                //             .orderDetailData!
                //             .products
                //             .firstOrNull!
                //             .order_id;
                //         context.read<OrderDetailBloc>().add(
                //               OrderDetailCancel(
                //                 orderId: orderId!,
                //                 reason: _selectedReason.en,
                //               ),
                //             );
                //         Navigator.of(context).pop();
                //       },
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: MediaQuery.viewPaddingOf(context).bottom,
            ),
          ],
        ),
      ),
    );
  }
}

class CancelReason {
  CancelReason({
    required this.id,
    required this.en,
    required this.km,
  });

  final int id;
  final String en;
  final String km;
}
