import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verdora_app/core/theme/colors.dart';
import 'package:verdora_app/core/theme/fonts.dart';

const ColorScheme colorSchemeDart = ColorScheme(
  surface: AppColors.black,
  onSurface: AppColors.white,
  //
  primary: AppColors.vDarkPrimaryColor,
  // primaryContainer: Color(0xFFEE3075),
  onPrimary: AppColors.white,
  secondary: AppColors.secondary,
  secondaryContainer: Color(0xFFF7F7F7),
  onSecondary: Color(0xFFF7F7F7),
  //
  error: Color(0xFFF0271B),
  onError: Color(0xFFFFFFFF),
  brightness: Brightness.dark,
  //neutrals
);

final colorSchemeDartExt = AppColorScheme(
  dark: AppColors.white,
  white: AppColors.black,
  primary: AppColors.primary,
  secondary: AppColors.secondary,
  tertiary: AppColors.tertiary,
  primaryText: AppColors.greySecondary,
  secondaryText: AppColors.secondaryTextLight,
  neutral0: AppColors.neutral100,
  neutral4: AppColors.neutral98,
  neutral6: AppColors.neutral96,
  neutral10: AppColors.neutral94,
  neutral12: AppColors.neutral92,
  neutral17: AppColors.neutral90,
  neutral20: AppColors.neutral89,
  neutral22: AppColors.neutral87,
  neutral24: AppColors.neutral80,
  neutral30: AppColors.neutral72,
  neutral40: AppColors.neutral70,
  neutral50: AppColors.neutral60,
  neutral60: AppColors.neutral50,
  neutral70: AppColors.neutral40,
  neutral72: AppColors.neutral30,
  neutral80: AppColors.neutral24,
  neutral87: AppColors.neutral22,
  neutral89: AppColors.neutral20,
  neutral90: AppColors.neutral17,
  neutral92: AppColors.neutral12,
  neutral94: AppColors.neutral10,
  neutral95: AppColors.neutral6,
  neutral96: AppColors.neutral4,
  neutral98: AppColors.neutral0,
  neutral100: AppColors.neutral0,
  purpleLight: AppColors.purpleLight,
  purplePrimary: AppColors.purplePrimary,
  purpleDark: AppColors.purpleDark,
  orangeLight: AppColors.orangeLight,
  orangePrimary: AppColors.orangePrimary,
  greenLight: AppColors.greenLight,
  greenPrimary: AppColors.greenPrimary,
  greenDark: AppColors.greenDark,
  greyLight: AppColors.greyLight,
  greyPrimary: AppColors.greyPrimary,
  greySecondary: AppColors.greySecondary,
  greyDark: AppColors.greyDark,
  transparent: AppColors.transparent,
  darkShadeGrey100: AppColors.lightShadeGrey10,
  darkShadeGrey60: AppColors.lightShadeGrey40,
  darkShadeGrey70: AppColors.lightShadeGrey30,
  darkShadeGrey80: AppColors.lightShadeGrey20,
  darkShadeGrey90: AppColors.lightShadeGrey10,
  lightShadeGrey10: AppColors.darkShadeGrey90,
  lightShadeGrey20: AppColors.darkShadeGrey80,
  lightShadeGrey30: AppColors.darkShadeGrey70,
  lightShadeGrey40: AppColors.darkShadeGrey60,
  lightShadeGrey50: AppColors.lightShadeGrey50,
  pureDark: AppColors.pureWhite,
  pureWhite: AppColors.neutral4,
  // my own color
  vBgColor: AppColors.vBgColor,
  vPrimaryColor: AppColors.vPrimaryColor,
  vAccentColor: AppColors.vAccentColor,
  vButtonColor: AppColors.vButtonColor,
  vDarkTextColor: AppColors.vDarkTextColor,
  vLightTextColor: AppColors.vLightTextColor,
  vIconColor: AppColors.vIconColor,
  vErrorColor: AppColors.vErrorColor,

  vDarkBgColor: AppColors.vDarkBgColor,
  vDarkAccentColor: AppColors.vDarkAccentColor,
  vDarkButtonColor: AppColors.vDarkButtonColor,
  vDarkErrorColor: AppColors.vDarkErrorColor,
  vDarkIconColor: AppColors.vDarkIconColor,
  vDarkPrimaryColor: AppColors.vDarkPrimaryColor,

  vContainerColor: AppColors.vDarkContainerColor,
  vDarkContainerColor: AppColors.vContainerColor,
);

final darkTheme = ThemeData(
  extensions: [
    colorSchemeDartExt,
    const FlashToastTheme(),
    const FlashBarTheme(),
  ],
  useMaterial3: false,
  chipTheme: ChipThemeData(
    secondaryLabelStyle: const TextStyle(
      color: Colors.black,
      fontFamily: Fonts.en,
      fontSize: 12,
    ),
    deleteIconColor: Colors.black,
    backgroundColor: colorSchemeDartExt.primary,
    checkmarkColor: Colors.black,
    labelStyle: const TextStyle(
      color: Colors.black,
      fontFamily: Fonts.en,
      fontSize: 12,
    ),
  ),
  scaffoldBackgroundColor: AppColors.vDarkBgColor,
  // dividerTheme:
  //     const DividerThemeData(thickness: 0.5, color: AppColors.divider),
  textTheme: Typography.material2021().white
      .copyWith(
        displayLarge: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          fontFamilyFallback: [Fonts.kh],
        ),
        displayMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontFamilyFallback: [Fonts.kh],
        ),
        displaySmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelSmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamilyFallback: [Fonts.kh],
        ),
      )
      .apply(
        bodyColor: colorSchemeDartExt.primaryText,
        displayColor: colorSchemeDartExt.primaryText,
        fontFamilyFallback: [Fonts.kh],
      ),
  colorScheme: colorSchemeDart,
  primaryColor: colorSchemeDartExt.primary,
  // primaryColorDark: colorSchemeLightExt.primary900,
  // primaryColorLight: colorSchemeLightExt.primary400,
  datePickerTheme: const DatePickerThemeData(),
  fontFamily: Fonts.en,
  fontFamilyFallback: const [Fonts.kh, Fonts.en],
  expansionTileTheme: ExpansionTileThemeData(
    backgroundColor: Colors.transparent,
    childrenPadding: const EdgeInsets.all(16),
    iconColor: colorSchemeDartExt.primary,
    textColor: colorSchemeDartExt.primaryText,
    collapsedTextColor: colorSchemeDartExt.primaryText,
    collapsedIconColor: colorSchemeDartExt.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      // color: colorSchemeDartExt.lightShadeGray50,
      fontFamilyFallback: [Fonts.en, Fonts.kh],
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    fillColor: Colors.transparent,
    filled: true,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        width: 2,
        color: colorSchemeDartExt.primary,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 2,
        // color: Colors.red,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0.5,
        // color: colorSchemeDartExt.darkShadeGray60,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0.5,
        // color: AppColors.borderColor,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    enableFeedback: false,
    elevation: 1,
    backgroundColor: ThemeData.dark().bottomNavigationBarTheme.backgroundColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primary,
    // unselectedItemColor: colorSchemeDartExt.lightShadeGray50,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    selectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.kh],
      height: 1.8,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: Fonts.en,
      color: AppColors.secondaryTextLight,
      fontFamilyFallback: [Fonts.kh],
      height: 1.8,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) {
      return const Icon(
        Icons.chevron_left_rounded,
        size: 36,
      );
    },
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      padding: const EdgeInsets.all(10),
      iconSize: 20,
      backgroundColor: colorSchemeDart.surface,
      foregroundColor: colorSchemeDart.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamilyFallback: const [Fonts.kh],
      color: colorSchemeDart.onSurface,
      fontFamily: Fonts.en,
    ),
    iconTheme: IconThemeData(
      color: colorSchemeDart.onSurface,
    ),
    elevation: 0,
    backgroundColor: AppColors.vDarkBgColor,
    actionsIconTheme: IconThemeData(
      size: 24,
      color: colorSchemeDart.onSurface,
    ),
    centerTitle: true,
  ),
);
