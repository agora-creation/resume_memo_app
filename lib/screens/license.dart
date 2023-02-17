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

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  List<Map<String, dynamic>> licenseData = [];

  void _selectLicense() async {
    final data = await DBController.selectLicense();
    setState(() => licenseData = data);
  }

  @override
  void initState() {
    super.initState();
    _selectLicense();
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
                  '免許・資格',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                size: ColumnSize.L,
              ),
            ],
            rows: List<DataRow>.generate(
              licenseData.length,
              (index) {
                DateTime month = DateTime.parse(licenseData[index]['month']);
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
                            data: licenseData[index],
                          ),
                        ).then((value) {
                          _selectLicense();
                        });
                      },
                    ),
                    DataCell(
                      Text(
                        licenseData[index]['memo'],
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ModDialog(
                            data: licenseData[index],
                          ),
                        ).then((value) {
                          _selectLicense();
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
          labelText: '免許・資格を追加',
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => const AddDialog(),
            ).then((value) {
              _selectLicense();
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
            '免許・資格',
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
                  await DBController.insertLicense(
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
            '免許・資格',
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
                  await DBController.deleteLicense(
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
                  await DBController.updateLicense(
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
