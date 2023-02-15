import 'package:flutter/material.dart';
import 'package:resume_memo_app/helpers/functions.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      children: [
        Table(
          border: TableBorder.all(),
          children: [
            generateTableHead('志望動機、特技、好きな学科、アピールポイントなど'),
            TableRow(
              children: [
                ListTile(
                  title: const Text(
                      'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {},
                ),
              ],
            ),
            generateTableHead('本人希望記入欄 (特に給料・職種・勤務時間・勤務地・その他についての希望などがあれば記入)'),
            TableRow(
              children: [
                ListTile(
                  title: const Text(''),
                  trailing: const Icon(Icons.edit),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
