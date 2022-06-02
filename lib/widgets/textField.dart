// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, type_init_formals, must_be_immutable, camel_case_types, file_names

import 'package:flutter/material.dart';
import '../constant_design.dart';

class text_field extends StatelessWidget {
  text_field({
    required TextEditingController this.Text_field_controller,
    this.isVisible = false,
    this.suffix_icon = const Icon(Icons.ac_unit),
    this.hintText = '',
    this.line_no = 1,
    this.isPassword = false,
    this.inputType = TextInputType.streetAddress,
    this.inputColor = Colors.white,
  });

  final TextEditingController Text_field_controller;
  bool isVisible;
  Icon suffix_icon;
  var hintText;
  int line_no;
  bool isPassword;
  var inputType;
  Color inputColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      color: Styles.primary_black_light,
      child: TextFormField(
        keyboardType: inputType,
        obscureText: isPassword,
        maxLines: line_no,
        style: TextStyle(color: inputColor),
        controller: Text_field_controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 12,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Styles.primary_green, width: 2.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: hintText,
          suffixIcon: Visibility(
            visible: isVisible,
            child: suffix_icon,
          ),
          hintStyle: Styles.RegularText.copyWith(
            color: const Color(0xFF37424F),
          ),
        ),
      ),
    );
  }
}
