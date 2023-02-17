import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columns: const [
        DataColumn(
          label: Text('年月'),
        ),
        DataColumn(
          label: Text('学歴・職歴'),
        ),
      ],
      rows: List<DataRow>.generate(
        100,
        (index) => const DataRow(
          cells: [
            DataCell(Text('2022年11月')),
            DataCell(Text('高知県幡多郡宿毛公共強盗学校')),
          ],
        ),
      ),
    );
  }
}
