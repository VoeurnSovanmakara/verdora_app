import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/core/theme/spacing.dart';

class TrackingOrder extends StatefulWidget {
  const TrackingOrder({super.key});

  @override
  State<TrackingOrder> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(Spacing.normal),
      decoration: BoxDecoration(
        color: context.colors.vContainerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Status',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Pending',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.vPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.l),
          EasyStepper(
            activeStep: activeStep,
            showLoadingAnimation: false,
            stepRadius: 12,
            showStepBorder: false,
            steps: [
              EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: colors.dark,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: activeStep >= 0
                        ? colors.vPrimaryColor
                        : Colors.white,
                  ),
                ),
                title: 'Pending',
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: colors.dark,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: activeStep >= 1
                        ? colors.vPrimaryColor
                        : Colors.white,
                  ),
                ),
                title: 'Accepted',
                placeTitleAtStart: true,
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: colors.dark,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: activeStep >= 2
                        ? colors.vPrimaryColor
                        : Colors.white,
                  ),
                ),
                title: 'Preparing',
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: colors.dark,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: activeStep >= 3
                        ? colors.vPrimaryColor
                        : Colors.white,
                  ),
                ),
                title: 'On Way',
                placeTitleAtStart: true,
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: colors.dark,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: activeStep >= 4
                        ? colors.vPrimaryColor
                        : Colors.white,
                  ),
                ),
                title: 'Delivered',
              ),
            ],
            onStepReached: (index) => setState(() => activeStep = index),
          ),
        ],
      ),
    );
  }
}
