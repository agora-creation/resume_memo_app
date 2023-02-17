import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final Color color;
  final String labelText;
  final Function() onTap;

  const ExpandedButton({
    required this.color,
    required this.labelText,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: color,
      title: Center(
        child: Text(
          labelText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
