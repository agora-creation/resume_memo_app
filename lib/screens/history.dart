import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:resume_memo_app/helpers/db_controller.dart';
import 'package:resume_memo_app/helpers/functions.dart';
import 'package:resume_memo_app/helpers/models.dart';
import 'package:resume_memo_app/widgets/custom_month_field.dart';
import 'package:resume_memo_app/widgets/custom_text_button.dart';
import 'package:resume_memo_app/widgets/custom_text_field.dart';
import 'package:resume_memo_app/widgets/expanded_button.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> historyData = [];

  void _selectHistory() async {
    final data = await DBController.selectHistory();
    setState(() => historyData = data);
  }

  @override
  void initState() {
    super.initState();
    _selectHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DataTable2(
            border: TableBorder.all(),
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => Colors.grey.shade300,
            ),
            columns: const [
              DataColumn2(
                label: Text(
                  '年月',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                size: ColumnSize.S,
              ),
              DataColumn2(
                label: Text(
                  '学歴・職歴',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                size: ColumnSize.L,
              ),
            ],
            rows: List<DataRow>.generate(
              historyData.length,
              (index) {
                DateTime month = DateTime.parse(historyData[index]['month']);
                String monthText = dateText('yyyy年MM月', month);
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        monthText,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ModDialog(
                            data: historyData[index],
                          ),
                        ).then((value) {
                          _selectHistory();
                        });
                      },
                    ),
                    DataCell(
                      Text(
                        historyData[index]['memo'],
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ModDialog(
                            data: historyData[index],
                          ),
                        ).then((value) {
                          _selectHistory();
                        });
                      },
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
        ExpandedButton(
          color: Colors.blue,
          labelText: '学歴・職歴を追加',
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => const AddDialog(),
            ).then((value) {
              _selectHistory();
            });
          },
        ),
      ],
    );
  }
}

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  DateTime month = DateTime.now();
  TextEditingController memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '年月',
            style: TextStyle(fontSize: 14),
          ),
          CustomMonthField(
            month: dateText('yyyy年MM月', month),
            onTap: () async {
              await DatePicker.showPicker(context,
                  showTitleActions: true,
                  pickerModel: YearMonthModel(
                    currentTime: DateTime.now(),
                    minTime: DateTime.now().subtract(
                      const Duration(days: 365 * 100),
                    ),
                    maxTime: DateTime.now(),
                    locale: LocaleType.jp,
                  ),
                  locale: LocaleType.jp, onConfirm: (date) {
                setState(() => month = date);
              });
            },
          ),
          const SizedBox(height: 8),
          const Text(
            '学歴・職歴',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: false,
            textInputAction: TextInputAction.done,
            controller: memoController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '追加する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.insertHistory(
                    month: month,
                    memo: memoController.text,
                  );
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

class ModDialog extends StatefulWidget {
  final Map<String, dynamic> data;

  const ModDialog({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<ModDialog> createState() => _ModDialogState();
}

class _ModDialogState extends State<ModDialog> {
  DateTime month = DateTime.now();
  TextEditingController memoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    month = DateTime.parse(widget.data['month']);
    memoController.text = widget.data['memo'];
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '年月',
            style: TextStyle(fontSize: 14),
          ),
          CustomMonthField(
            month: dateText('yyyy年MM月', month),
            onTap: () async {
              await DatePicker.showPicker(context,
                  showTitleActions: true,
                  pickerModel: YearMonthModel(
                    currentTime: DateTime.now(),
                    minTime: DateTime.now().subtract(
                      const Duration(days: 365 * 100),
                    ),
                    maxTime: DateTime.now(),
                    locale: LocaleType.jp,
                  ),
                  locale: LocaleType.jp, onConfirm: (date) {
                setState(() => month = date);
              });
            },
          ),
          const SizedBox(height: 8),
          const Text(
            '学歴・職歴',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: false,
            textInputAction: TextInputAction.done,
            controller: memoController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                labelText: '削除する',
                backgroundColor: Colors.red,
                onPressed: () async {
                  await DBController.deleteHistory(
                    id: widget.data['id'],
                  );
                  if (!mounted) return;
                  Navigator.pop(context);
                },
              ),
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateHistory(
                    id: widget.data['id'],
                    month: month,
                    memo: memoController.text,
                  );
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
