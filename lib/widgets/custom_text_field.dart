import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool autofocus;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final TextInputType textInputType;

  const CustomTextField({
    required this.autofocus,
    required this.textInputAction,
    required this.controller,
    required this.textInputType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
      ),
      child: TextField(
        autofocus: autofocus,
        textInputAction: textInputAction,
        controller: controller,
        keyboardType: textInputType,
        style: const TextStyle(fontSize: 16),
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
