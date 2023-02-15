import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      children: [
        Table(
          border: TableBorder.all(),
          columnWidths: const {
            0: FixedColumnWidth(100),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.all(8),
                  child: const TableCell(
                    child: Text(
                      '年月',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.shade300,
                  padding: const EdgeInsets.all(8),
                  child: const TableCell(
                    child: Text(
                      '学歴・職歴',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                ListTile(
                  title: Text('2022/03', style: TextStyle(fontSize: 16)),
                ),
                ListTile(
                  title: Text(
                      'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      style: TextStyle(fontSize: 16)),
                  trailing: const Icon(Icons.edit),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('追加'),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
