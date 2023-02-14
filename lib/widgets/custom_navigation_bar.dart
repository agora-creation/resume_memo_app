import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF333333)),
        ),
      ),
      child: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: const Color(0xFFFEFEFE),
        elevation: 0,
        currentIndex: currentIndex,
        fixedColor: Colors.blue.shade600,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '個人情報',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '学歴・職歴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.military_tech),
            label: '免許・資格',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: '志望動機など',
          ),
        ],
      ),
    );
  }
}
