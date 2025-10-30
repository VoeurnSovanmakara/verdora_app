import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verdora_app/core/app_bloc/lang/language_bloc.dart';

abstract class TextUtil {
  /// Utility for getting text based on the current selected locale
  ///
  /// Fallback to another language if current selected text does not exists
  static String getTextLocale(
    BuildContext context, {
    String? textEn,
    String? textKh,
  }) {
    final locale = context.watch<LanguageBloc>().state.selectLanguage;
    if (locale.languageCode == 'km') {
      if (textKh != null) {
        if (textKh.isNotEmpty) {
          return textKh;
        } else {
          return textEn ?? '';
        }
      } else {
        return textEn ?? '';
      }
    } else {
      return textEn ?? '';
    }
  }
}
