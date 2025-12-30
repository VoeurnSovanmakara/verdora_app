import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';
import 'package:verdora_app/l10n/l10n.dart';

class CustomModal {
  static Future<void> normalMainModal(
    BuildContext context,
    Widget Function(BuildContext) builder,
  ) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      backgroundColor: context.colors.white,
      context: context,
      builder: (modalContext) => Container(
        padding: const EdgeInsets.all(16),
        height: 250 + MediaQuery.viewInsetsOf(context).bottom / 2,
        child: builder(modalContext),
      ),
    );
  }

  static Future<void> showRoundedModal(
    BuildContext context,
    Widget Function(BuildContext) builder, {
    double radius = 12,
  }) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
      ),
      backgroundColor: context.colors.neutral92,
      context: context,
      builder: builder,
    );
  }

  static Future<void> longModal(
    BuildContext context,
    Widget Function(BuildContext) builder,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true, // Enables full-screen modal
      enableDrag: false, // Disables scroll dismiss
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      backgroundColor: context.colors.white,
      context: context,
      builder: (BuildContext bottomSheetContext) => FractionallySizedBox(
        heightFactor: 0.80, // Takes the full height of the screen
        child: Padding(
          padding: EdgeInsets.only(
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: builder(bottomSheetContext),
        ),
      ),
    );
  }

  static Future<void> permissionModal(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder:
          (
            BuildContext context,
          ) {
            final l10n = context.l10n;
            return CupertinoAlertDialog(
              title: Text(
                l10n.need_location_access,
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pop();
                  },
                  child: Text(
                    l10n.cancel,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: () async {
                    await openAppSettings();
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    l10n.open_setting,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
              content: Text(
                l10n.need_location_access_info,
              ),
            );
          },
    );
  }
}
