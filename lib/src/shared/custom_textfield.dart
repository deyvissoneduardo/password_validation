import 'package:flutter/material.dart';

import 'colors_app.dart';

class CustomTextfield extends StatefulWidget {
  final String label;
  final String? hintText;
  final Color backgroundColor;
  final Widget? suffix;
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Key? textFieldKey;
  final FocusNode? focusNode;
  const CustomTextfield({
    super.key,
    required this.label,
    this.hintText,
    required this.backgroundColor,
    this.suffix,
    required this.controller,
    required this.obscureText,
    this.validator,
    this.textFieldKey,
    this.focusNode,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),

        TextFormField(
          key: widget.textFieldKey,
          controller: widget.controller,
          obscureText: widget.obscureText,
          validator: widget.validator,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.backgroundColor,
            hintText: widget.hintText,
            suffixIcon: widget.suffix,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
