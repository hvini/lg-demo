import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  const CustomTextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  final Function()? onPressed;
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(iconData, color: const Color(0xff328267)),
      label: Text(label, style: const TextStyle(color: Color(0xff328267))),
      onPressed: onPressed,
    );
  }
}
