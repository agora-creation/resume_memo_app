import 'package:flutter/material.dart';
import 'package:resume_memo_app/screens/history.dart';
import 'package:resume_memo_app/screens/license.dart';
import 'package:resume_memo_app/screens/motivation.dart';
import 'package:resume_memo_app/screens/user.dart';
import 'package:resume_memo_app/widgets/custom_navigation_bar.dart';

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
      bottomNavigationBar: CustomNavigationBar(
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
