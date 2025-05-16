//
// File: button_widget.dart
//
// Purpose: DenbtLabWeb button widget.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 12.05.2025
//

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:dentlabweb/presentation/dentlabweb_theme_constants.dart';

///
/// Class: DentButton
///
/// Purpose: Implements the DentLabWeb button widget.
///
class DentButton extends StatelessWidget {
  final Function _sendBtnPressed;
  final String _buttonText;
  final Color _buttonBackgroundColor;
  final Color _buttonForgroundColor;

  ///
  /// Class constructor.
  ///
  /// @param _buttonText Button text to be shown.
  /// @param _sendBtnPressed Function to be called when button is pressed.
  /// @param _buttonBackgroundColor Button background color.
  /// @param _buttonForgroundColor Button foreground color.
  ///
  const DentButton(
    this._buttonText,
    this._sendBtnPressed,
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
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          _sendBtnPressed(context);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(_buttonBackgroundColor),
          foregroundColor: WidgetStateProperty.all(_buttonForgroundColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(MdiIcons.login, size: 20.0, color: _buttonForgroundColor),
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
