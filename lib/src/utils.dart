import 'package:flutter/material.dart';

class Utils {
  static String countryCodeToEmoji(String countryCode) {
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol

    if (countryCode == 'SY') {
      // Returning empty string here since I will show a custom image instead
      return '';
    }

    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  static Widget buildFlagWidget(String countryCode) {
    final code = countryCode.toUpperCase();

    if (code == 'SY') {
      return Image.asset(
        'assets/custom_flags/sy.png',
        package: 'country_picker',
        width: 32,
        height: 32,
        cacheWidth: 64,
        isAntiAlias: true,
        filterQuality: FilterQuality.high,
      );
    }

    return Text(
      countryCodeToEmoji(code),
      style: const TextStyle(fontSize: 24),
    );
  }
}
