//
// File: jumbo_list_form.dart
//
// Purpose: DentLabWeb jumbo list form widget.
//
// Author: Thomas Burgard (Dipl.-Ing.) BURGARDsoft Softwareentwicklung
// Copyright: (c) 2025 BURGARDsoft Softwareentwicklung - All rights reserved
//
// Created: 21.05.2025
// Modified: 21.05.2025
//

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

import 'package:dentlabweb/cubit/jumbo/jumbo_cubit.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_theme_constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:dentlabweb/presentation/common_widgets/button_short_width.dart';
import 'package:dentlabweb/presentation/common_widgets/button_full_width.dart';
import 'package:dentlabweb/presentation/constants/dentlabweb_string_constants.dart';

///
/// Class: JumboListForm
///
/// Purpose: Implements the DentLabWeb jumbo list form widget.
///

/// ignore: must_be_immutable
class JumboListForm extends StatefulWidget {
  ///
  /// Class constructor.
  ///
  const JumboListForm({super.key});

  ///
  /// Create _CreateBookingPageState state object.
  ///
  @override
  State<JumboListForm> createState() => _JumboListFormState();
}

///
/// Class: _JumboListFormState
///
/// Purpose: Implements the private state for jumbo form.
///
class _JumboListFormState extends State<JumboListForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _isJumboListLoading = true;
  late bool _jumboImportProcessing = false;
  late bool _showJumboImportArea = true;
  late String _jumboFileContent = '';
  late List<String> _jumboFileAsList = [];
  late List<dynamic> _jumboList = [];
  final TextEditingController _controllerSelectedJumboFile =
      TextEditingController();

  ///
  /// Is called after the State object has been created
  /// and the widget tree has been built, but before the
  /// widget is displayed on the screen.
  ///
  @override
  void initState() {
    super.initState();
  }

  ///
  /// Show Jumbo import area.
  ///
  Widget showJumboImportArea() {
    return Column(
      children: [        
        Row(
          mainAxisAlignment: MainAxisAlignment.end,          
          children: [            
            //------------------------------------
            // Show selected jumbo file text field
            //------------------------------------            
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: _controllerSelectedJumboFile,
                style: const TextStyle(
                  fontSize: DentUIThemeConstants.fontSize16,
                  fontFamily: DentUIThemeConstants.dentFontFamily,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  floatingLabelStyle: const TextStyle(
                    fontSize: DentUIThemeConstants.fontSize16,
                  ),
                  border: const OutlineInputBorder(),
                  hintText: DentUIStringConstants.jumboPageSelectedFilePlacehoderText,
                ),
              ),
            ),
            const SizedBox(width: 5),
            //-------------------------
            // Select jumbo file button
            //-------------------------
            DentButtonShort(
              Icon(MdiIcons.file, size: 20.0, color: Colors.white),
              DentUIStringConstants.jumboPageFilePickerButtonText,
              selectJumboFileBtnPressedEvent,
              DentUIThemeConstants.dentColorBlack,
              DentUIThemeConstants.dentLightTextColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
        //----------------------------------
        // Import selected jumbo file button
        //----------------------------------
        DentButtonFull(
          Icon(MdiIcons.import, size: 20.0, color: Colors.white),
          DentUIStringConstants.jumboPageImportJumboButtonText,
          importJumboBtnPressedEvent,
          DentUIThemeConstants.dentColorBlue,
          DentUIThemeConstants.dentLightTextColor,
        ),
      ],
    );
  }

  ///
  /// Button pressed event handler: Select jumbo JSON-File.
  ///
  void selectJumboFileBtnPressedEvent(BuildContext context) async {
    FilePickerResult? picked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      allowMultiple: false,
    );

    if (picked != null) {
      final file = picked.files.first;

      setState(() {
        _controllerSelectedJumboFile.text = picked.files.single.name;
      });

      _jumboFileContent = utf8.decode(file.bytes!);
      _jumboFileAsList = _jumboFileContent.split('\n');
    } else {
      // User canceled the picker
    }
  }

  ///
  /// Button pressed event handler: Import jumbo file.
  ///
  void importJumboBtnPressedEvent(BuildContext context) {
    BlocProvider.of<JumboCubit>(context).importJumbo(
      jumboFileContent: _jumboFileContent,
      jumboFileAsList: _jumboFileAsList,
    );
  }

  ///
  /// Show jumbo import result info.
  ///
  void showJumboImportResultInfo(bool jumboImportSuccess) {
    if (jumboImportSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: DentUIThemeConstants.dentColorGreen,
          content: Text(DentUIStringConstants.jumboPageImportJumboSuccessText),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: DentUIThemeConstants.dentColorRed,
          content: Text(DentUIStringConstants.jumboPageImportJumboErrorText),
        ),
      );
    }
  }

  ///
  /// Build method for showing the wigdets tree.
  ///
  @override
  Widget build(BuildContext context) {
    // Get the screen width of device
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<JumboCubit, CubitJumboState>(
      listener: (context, state) {
        if (state is CubitJumboLoading) {
          _isJumboListLoading = state.isLoading;
        } else if (state is CubitJumboShowImportArea) {
          _isJumboListLoading = state.showJumboImportArea;
        } else if (state is CubitJumboImport) {
          _jumboImportProcessing = state.jumboImportProccesing;
        } else if (state is CubitJumboImportError) {
          _isJumboListLoading = false;
          _jumboImportProcessing = false;
          showJumboImportResultInfo(state.importSuccess);
        } else if (state is CubitCommunicationError) {
          _isJumboListLoading = false;
          _jumboImportProcessing = false;
        } else if (state is CubitInternalServerError) {
          _isJumboListLoading = false;
          _jumboImportProcessing = false;
        } else if (state is CubitInternalServerError) {
          _isJumboListLoading = false;
          _jumboImportProcessing = false;
        }
      },
      builder: (context, state) {
        return Padding(
          padding:
              screenWidth < 1280
                  ? const EdgeInsets.symmetric(horizontal: 20)
                  : const EdgeInsets.symmetric(horizontal: 450),
          child: Column(
            children: [
              const SizedBox(height: 30),
              //-----------------------
              // Show Jumbo import area
              //-----------------------
              showJumboImportArea(),
              SizedBox(height: 10),
              //----------------------------------
              // Show jumbo import file proccesing
              // progress indicator or not
              //----------------------------------
              _jumboImportProcessing
                  ? Column(
                    children: [
                      SizedBox(height: 10),
                      const LinearProgressIndicator(
                        color: DentUIThemeConstants.dentColorBlue,
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                  : SizedBox(height: 0),
            ],
          ),
        );
      },
    );
  }
}
