import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    this.enabled = true,
    this.obscureText = false,
    this.autovalidate = false,
    required this.labelText,
    required this.initialValue,
    this.keyboardType,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final bool enabled;
  final bool obscureText;
  final bool autovalidate;
  final String labelText;
  final String initialValue;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode:
            autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        validator: validator,
        initialValue: initialValue,
        enabled: enabled,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Color(0xff378F71)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff378F71)),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff378F71)),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff378F71)),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff378F71)),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        onChanged: onChanged);
  }
}
