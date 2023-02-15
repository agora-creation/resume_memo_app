import 'package:flutter/material.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
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
            const TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TableCell(
                    child: Text(
                      '2022年05月',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TableCell(
                    child: Text(
                      'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
