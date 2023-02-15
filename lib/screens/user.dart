import 'package:flutter/material.dart';
import 'package:resume_memo_app/helpers/functions.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController nameRuby = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController birthDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      children: [
        const CircleAvatar(
          backgroundColor: Colors.lightBlue,
          radius: 80,
        ),
        const SizedBox(height: 16),
        Table(
          border: TableBorder.all(),
          children: [
            generateTableHead('ふりがな'),
            TableRow(
              children: [
                ListTile(
                  title: const Text('しまむらゆうた'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {},
                ),
              ],
            ),
            generateTableHead('氏名'),
            TableRow(
              children: [
                ListTile(
                  title: const Text('島村裕太'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {},
                ),
              ],
            ),
            generateTableHead('生年月日'),
            TableRow(
              children: [
                ListTile(
                  title: const Text('1993年10月27日 (満00歳)'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () {},
                ),
              ],
            ),
            generateTableHead('性別'),
            TableRow(
              children: [
                ListTile(
                  title: const Text('男'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {},
                ),
              ],
            ),
            generateTableHead('現住所'),
            TableRow(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('〒780-8035'),
                      Text('高知県高知市河ノ瀬町178番地1 ハッピネス裕202'),
                    ],
                  ),
                  trailing: const Icon(Icons.edit),
                  onTap: () {},
                ),
              ],
            ),
            generateTableHead('その他住所'),
            TableRow(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('〒780-8035'),
                      Text('高知県高知市河ノ瀬町178番地1 ハッピネス裕202'),
                    ],
                  ),
                  trailing: const Icon(Icons.edit),
                  onTap: () {},
                ),
              ],
            ),
            generateTableHead('携帯電話番号'),
            TableRow(
              children: [
                ListTile(
                  title: const Text('090-6289-3491'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {},
                ),
              ],
            ),
            generateTableHead('自宅電話番号'),
            TableRow(
              children: [
                ListTile(
                  title: const Text('090-6289-3491'),
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
