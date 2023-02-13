import 'package:flutter/material.dart';
import 'package:resume_memo_app/screens/history.dart';
import 'package:resume_memo_app/screens/license.dart';
import 'package:resume_memo_app/screens/motivation.dart';
import 'package:resume_memo_app/screens/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabsContent = [
    const UserScreen(),
    const HistoryScreen(),
    const LicenseScreen(),
    const MotivationScreen(),
  ];
  List<String> tabsName = [
    '個人情報',
    '学歴・職歴',
    '免許・資格',
    '志望動機など',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('履歴書メモ > ${tabsName[currentIndex]}'),
      ),
      body: tabsContent[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFF333333)),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() => currentIndex = index);
          },
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
      ),
    );
  }
}
