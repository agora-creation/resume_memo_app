import 'package:flutter/material.dart';

class CustomMonthField extends StatelessWidget {
  final String month;
  final Function() onTap;

  const CustomMonthField({
    required this.month,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
      ),
      child: ListTile(
        title: Text(month),
        trailing: const Icon(Icons.calendar_month),
        onTap: onTap,
      ),
    );
  }
}
