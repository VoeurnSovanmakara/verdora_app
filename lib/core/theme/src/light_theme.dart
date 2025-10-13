import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verdora_app/core/theme/colors.dart';
import 'package:verdora_app/core/theme/fonts.dart';

const ColorScheme colorSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: AppColors.white,
  secondary: AppColors.secondary,
  onSecondary: Color(0xFF1F1F1F),
  error: Color(0xFFF0271B),
  onError: Color(0xFFFFFFFF), 
  surface: AppColors.primaryBackground,
  onSurface: AppColors.primaryText,
);

final colorSchemeLightExt = AppColorScheme(
  dark: AppColors.black,
  white: AppColors.white,
  primary: AppColors.primary,
  primaryBackground: AppColors.primaryBackground,
  secondary: AppColors.secondary,
  secondaryBackground: AppColors.secondaryBackground,
  tertiary: AppColors.tertiary,
  primaryText: AppColors.primaryText,
  secondaryText: AppColors.secondaryText,
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
  transparent: AppColors.transparent,
  darkCyanBlue: AppColors.darkCyanBlue,
  blueLight: AppColors.blueLight,
  greyLight: AppColors.greyLight,
  redPrimary: AppColors.redPrimary,
  greyPrimary: AppColors.greyPrimary,
  greyDark: AppColors.greyDark,
  greySecondary: AppColors.greySecondary,
  processing: AppColors.processing,
  inDelivery: AppColors.inDelivery,
  delivered: AppColors.delivered,
);

final lightTheme = ThemeData(
  extensions: [
    colorSchemeLightExt,
    const FlashToastTheme(),
    const FlashBarTheme(),
  ],
  useMaterial3: true,
  textTheme: Typography.material2021()
      .black
      .copyWith(
        displayLarge: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        displayMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        displaySmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelSmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
      )
      .apply(
    bodyColor: colorSchemeLightExt.primaryText,
    displayColor: colorSchemeLightExt.primaryText,
    fontFamily: Fonts.en,
    fontFamilyFallback: [Fonts.kh],
  ),
  colorScheme: colorSchemeLight,
  primaryColor: colorSchemeLightExt.primary,
  datePickerTheme: const DatePickerThemeData(),
  fontFamily: Fonts.en,
  fontFamilyFallback: const [Fonts.kh, Fonts.en],
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: colorSchemeLight.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.en, Fonts.kh],
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    fillColor: colorSchemeLight.primary,
    filled: true,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        width: 2,
        color: colorSchemeLightExt.primary,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        width: 2,
        // color: Colors.red,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorSchemeLight.primary.withValues(alpha: 0.25),
      ),
      borderRadius: BorderRadius.circular(16),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0.5,
        // color: AppColors.borderColor,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    enableFeedback: false,
    elevation: 1,
    backgroundColor: ThemeData.dark().bottomNavigationBarTheme.backgroundColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primary,
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
      color: AppColors.secondaryText,
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
        size: 26,
      );
    },
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamilyFallback: const [Fonts.kh],
      color: colorSchemeLight.onSurface,
      fontFamily: Fonts.en,
    ),
    iconTheme: IconThemeData(
      color: colorSchemeLight.onSurface,
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    actionsIconTheme: IconThemeData(
      size: 24,
      color: colorSchemeLight.onSurface,
    ),
    centerTitle: true,
  ),
);
