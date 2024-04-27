import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}

double responsiveValue(
  BuildContext context, {
  Map<int, double>? bigger,
  double? large,
  double? desktop,
  double? tablet,
  double? phone,
}) {
  final width = MediaQuery.of(context).size.width;

  if (bigger != null) {
    for (int k in bigger.keys) {
      if (width > k) {
        return bigger[k]!;
      }
    }
  }
  if (large != null && width > 1600) return large;
  if (desktop != null && width > 1024) return desktop;
  if (tablet != null && width > 600) return tablet;
  return phone ?? 0;
}
