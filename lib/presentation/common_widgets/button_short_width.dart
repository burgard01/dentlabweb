//
// File: button_short_width.dart
//
// Purpose: DenbtLabWeb button widget.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
// Modified: 23.05.2025
//

import 'package:flutter/material.dart';

import 'package:dentlabweb/presentation/constants/dentlabweb_theme_constants.dart';

///
/// Class: DentButtonShort
///
/// Purpose: Implements the DentLabWeb button 
/// widget with short width (text width).
///
class DentButtonShort extends StatelessWidget {
  final Function _pressedBtnPressed;
  final String _buttonText;
  final Color _buttonBackgroundColor;
  final Color _buttonForgroundColor;
  final Icon icon;

  ///
  /// Class constructor.
  ///
  /// @param _buttonText Button text to be shown.
  /// @param _sendBtnPressed Function to be called when button is pressed.
  /// @param _buttonBackgroundColor Button background color.
  /// @param _buttonForgroundColor Button foreground color.
  ///
  const DentButtonShort(
    this.icon,
    this._buttonText,
    this._pressedBtnPressed,
    this._buttonBackgroundColor,
    this._buttonForgroundColor, {
    super.key,
  });

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          _pressedBtnPressed(context);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(_buttonBackgroundColor),
          foregroundColor: WidgetStateProperty.all(_buttonForgroundColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              // Change your radius here
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 5),
            Text(
              _buttonText,
              style: const TextStyle(
                fontFamily: DentUIThemeConstants.dentFontFamily,
                fontSize: DentUIThemeConstants.fontSize16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
