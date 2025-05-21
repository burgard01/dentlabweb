//
// File: order_list_form.dart
//
// Purpose: DentLabWeb order list form widget.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 21.05.2025
// Modified: 21.05.2025
//

import 'package:flutter/material.dart';

///
/// Class: OrderListForm
///
/// Purpose: Implements the DentLabWeb order list form widget.
///

/// ignore: must_be_immutable
class OrderListForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ///
  /// Class constructor.
  ///
  OrderListForm({super.key});

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    // Get the screen width of device
    double screenWidth = MediaQuery.of(context).size.width;

    return Placeholder();
  }
}
