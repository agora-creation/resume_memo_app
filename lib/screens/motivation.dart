import 'package:flutter/material.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('志望動機など'));
  }
}
