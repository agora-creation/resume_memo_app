import 'package:flutter/material.dart';
import 'package:resume_memo_app/helpers/db_controller.dart';
import 'package:resume_memo_app/helpers/functions.dart';
import 'package:resume_memo_app/widgets/custom_message_field.dart';
import 'package:resume_memo_app/widgets/custom_text_button.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  Map<String, dynamic>? motivationData;

  void _selectMotivation() async {
    final data = await DBController.selectMotivation();
    setState(() => motivationData = data.single);
  }

  @override
  void initState() {
    super.initState();
    _selectMotivation();
  }

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
                  title: Text('${motivationData?['memo'] ?? ''}'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => MemoDialog(
                        memo: '${motivationData?['memo'] ?? ''}',
                      ),
                    ).then((value) {
                      _selectMotivation();
                    });
                  },
                ),
              ],
            ),
            generateTableHead('本人希望記入欄 (特に給料・職種・勤務時間・勤務地・その他についての希望などがあれば記入)'),
            TableRow(
              children: [
                ListTile(
                  title: Text('${motivationData?['memo2'] ?? ''}'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Memo2Dialog(
                        memo2: '${motivationData?['memo2'] ?? ''}',
                      ),
                    ).then((value) {
                      _selectMotivation();
                    });
                  },
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

class MemoDialog extends StatefulWidget {
  final String memo;

  const MemoDialog({
    required this.memo,
    Key? key,
  }) : super(key: key);

  @override
  State<MemoDialog> createState() => _MemoDialogState();
}

class _MemoDialogState extends State<MemoDialog> {
  TextEditingController memoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    memoController.text = widget.memo;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '志望動機、特技、好きな学科、アピールポイントなど',
            style: TextStyle(fontSize: 14),
          ),
          CustomMessageField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            controller: memoController,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateMotivation({
                    'memo': memoController.text,
                  });
                  if (!mounted) return;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Memo2Dialog extends StatefulWidget {
  final String memo2;

  const Memo2Dialog({
    required this.memo2,
    Key? key,
  }) : super(key: key);

  @override
  State<Memo2Dialog> createState() => _Memo2DialogState();
}

class _Memo2DialogState extends State<Memo2Dialog> {
  TextEditingController memo2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    memo2Controller.text = widget.memo2;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '本人希望記入欄 (特に給料・職種・勤務時間・勤務地・その他についての希望などがあれば記入)',
            style: TextStyle(fontSize: 14),
          ),
          CustomMessageField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            controller: memo2Controller,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateMotivation({
                    'memo2': memo2Controller.text,
                  });
                  if (!mounted) return;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
