import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verdora_app/core/app_bloc/lang/language_bloc.dart';
import 'package:verdora_app/core/utils/src/text_util.dart';

class TextTranslate extends StatelessWidget {
  const TextTranslate({
    this.enText,
    this.kmText,
    super.key,
    this.style,
    this.maxLines = 2,
  });

  final String? enText;
  final String? kmText;
  final TextStyle? style;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return Text(
          TextUtil.getTextLocale(
            context,
            textEn: enText,
            textKh: kmText,
          ),
          style: style,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          maxLines: maxLines,
        );
      },
    );
  }
}
