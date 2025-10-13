import 'package:flutter/material.dart';
import 'package:verdora_app/core/theme/colors.dart';

extension BuildContextExt on BuildContext {
  AppColorScheme get colors {
    return Theme.of(this).extension<AppColorScheme>()!;
  }

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }
}
