import 'package:flutter/material.dart';

class CustomMessageField extends StatelessWidget {
  final bool autofocus;
  final TextInputAction textInputAction;
  final TextEditingController controller;

  const CustomMessageField({
    required this.autofocus,
    required this.textInputAction,
    required this.controller,
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
        keyboardType: TextInputType.multiline,
        maxLines: null,
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
