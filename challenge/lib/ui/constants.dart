import 'package:flutter/material.dart';

class AppConstants {
  // Padding global para mantener consistencia en toda la app
  static const defaultPadding = EdgeInsets.all(16);

  // Spacing vertical estandar
  static const verticalSpaceSmall = SizedBox(height: 8);
  static const verticalSpace = SizedBox(height: 16);
  static const verticalSpaceLarge = SizedBox(height: 24);

  // Spacing horizontal
  static const horizontalSpaceSmall = SizedBox(width: 8);
  static const horizontalSpace = SizedBox(width: 16);

  // Border radius global
  static const borderRadius = BorderRadius.all(Radius.circular(10));

  // Duraciones comunes (animaciones, loading, etc)
  static const fastAnimation = Duration(milliseconds: 150);
  static const normalAnimation = Duration(milliseconds: 300);

  // Default dropdown values / textos comunes
  static const dhcpOptions = ["Enabled", "Disabled"];
}