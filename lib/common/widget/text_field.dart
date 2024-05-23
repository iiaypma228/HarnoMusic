import 'dart:ui';

import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart';

class BaseTextField extends m.StatefulWidget {
  const BaseTextField(
      {super.key,
      this.hintText,
      this.expands,
      this.suffixIcon,
      this.obscureText,
      this.validator,
      this.onChange});

  final String? hintText;
  final bool? expands;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  @override
  m.State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends m.State<BaseTextField> {
  final _errorBorder = m.OutlineInputBorder(
      borderSide: m.BorderSide(
          color: const m.Color(0xffF4364C).withOpacity(0.2), width: 0.8),
      borderRadius: m.BorderRadius.circular(30.0));
  final _border = m.OutlineInputBorder(
      borderSide: m.BorderSide(
          color: const m.Color(0xff000000).withOpacity(0.2), width: 0.8),
      borderRadius: m.BorderRadius.circular(30.0));

  @override
  m.Widget build(m.BuildContext context) {
    return m.TextFormField(
      onChanged: widget.onChange,
      validator: widget.validator,
      maxLines: null,
      //obscureText: widget.obscureText ?? false,
      expands: widget.expands ?? false,
      decoration: m.InputDecoration(
        errorBorder: _errorBorder,
        suffixIcon: widget.suffixIcon,
        contentPadding: const EdgeInsets.only(left: 25),
        hintText: widget.hintText,
        hintStyle: m.TextStyle(
            color: const m.Color(0xff383838).withOpacity(0.6),
            fontWeight: FontWeight.w500,
            fontSize: 16),
        enabledBorder: _border,
        focusedErrorBorder: _errorBorder,
        focusedBorder: _border,
      ),
    );
  }
}
