import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:resume_memo_app/helpers/db_controller.dart';
import 'package:resume_memo_app/helpers/functions.dart';
import 'package:resume_memo_app/widgets/custom_text_button.dart';
import 'package:resume_memo_app/widgets/custom_text_field.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Map<String, dynamic>? userData;

  void _selectUser() async {
    final data = await DBController.selectUser();
    setState(() => userData = data.single);
  }

  @override
  void initState() {
    super.initState();
    _selectUser();
  }

  @override
  Widget build(BuildContext context) {
    String birthDate = userData?['birthDate'] ?? '';
    String birth = '----年--月--日';
    String age = '--';
    if (birthDate != '') {
      DateTime tmp = DateTime.parse(birthDate);
      birth = dateText('yyyy年MM月dd日', tmp);
      age = AgeCalculator.age(tmp).years.toString();
    }

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
                  title: Text('${userData?['nameRuby'] ?? ''}'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => NameRubyDialog(
                        nameRuby: '${userData?['nameRuby'] ?? ''}',
                      ),
                    ).then((value) {
                      _selectUser();
                    });
                  },
                ),
              ],
            ),
            generateTableHead('氏名'),
            TableRow(
              children: [
                ListTile(
                  title: Text('${userData?['name'] ?? ''}'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => NameDialog(
                        name: '${userData?['name'] ?? ''}',
                      ),
                    ).then((value) {
                      _selectUser();
                    });
                  },
                ),
              ],
            ),
            generateTableHead('生年月日'),
            TableRow(
              children: [
                ListTile(
                  title: Text(
                    '$birth　(満$age歳)',
                  ),
                  trailing: const Icon(Icons.edit),
                  onTap: () async {
                    await DatePicker.showDatePicker(
                      context,
                      locale: LocaleType.jp,
                      minTime: DateTime.now().subtract(
                        const Duration(days: 365 * 100),
                      ),
                      maxTime: DateTime.now().subtract(
                        const Duration(days: 365 * 10),
                      ),
                      onConfirm: (date) async {
                        await DBController.updateUser({
                          'birthDate': dateText('yyyy-MM-dd', date),
                        }).then((value) {
                          _selectUser();
                        });
                      },
                    );
                  },
                ),
              ],
            ),
            generateTableHead('性別'),
            TableRow(
              children: [
                ListTile(
                  title: Text('${userData?['gender'] ?? ''}'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => GenderDialog(
                        gender: '${userData?['gender'] ?? ''}',
                      ),
                    ).then((value) {
                      _selectUser();
                    });
                  },
                ),
              ],
            ),
            generateTableHead('現住所'),
            TableRow(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('〒${userData?['zip'] ?? ''}'),
                      Text('${userData?['address'] ?? ''}'),
                    ],
                  ),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AddressDialog(
                        zip: '${userData?['zip'] ?? ''}',
                        address: '${userData?['address'] ?? ''}',
                      ),
                    ).then((value) {
                      _selectUser();
                    });
                  },
                ),
              ],
            ),
            generateTableHead('その他住所'),
            TableRow(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('〒${userData?['zip2'] ?? ''}'),
                      Text('${userData?['address2'] ?? ''}'),
                    ],
                  ),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Address2Dialog(
                        zip2: '${userData?['zip2'] ?? ''}',
                        address2: '${userData?['address2'] ?? ''}',
                      ),
                    ).then((value) {
                      _selectUser();
                    });
                  },
                ),
              ],
            ),
            generateTableHead('携帯電話番号'),
            TableRow(
              children: [
                ListTile(
                  title: Text('${userData?['tel'] ?? ''}'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => TelDialog(
                        tel: '${userData?['tel'] ?? ''}',
                      ),
                    ).then((value) {
                      _selectUser();
                    });
                  },
                ),
              ],
            ),
            generateTableHead('自宅電話番号'),
            TableRow(
              children: [
                ListTile(
                  title: Text('${userData?['tel2'] ?? ''}'),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Tel2Dialog(
                        tel2: '${userData?['tel2'] ?? ''}',
                      ),
                    ).then((value) {
                      _selectUser();
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

class NameRubyDialog extends StatefulWidget {
  final String nameRuby;

  const NameRubyDialog({
    required this.nameRuby,
    Key? key,
  }) : super(key: key);

  @override
  State<NameRubyDialog> createState() => _NameRubyDialogState();
}

class _NameRubyDialogState extends State<NameRubyDialog> {
  TextEditingController nameRubyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameRubyController.text = widget.nameRuby;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ふりがな',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            controller: nameRubyController,
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateUser({
                    'nameRuby': nameRubyController.text.trim(),
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

class NameDialog extends StatefulWidget {
  final String name;

  const NameDialog({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  State<NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<NameDialog> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '氏名',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            controller: nameController,
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateUser({
                    'name': nameController.text.trim(),
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

class GenderDialog extends StatefulWidget {
  final String gender;

  const GenderDialog({
    required this.gender,
    Key? key,
  }) : super(key: key);

  @override
  State<GenderDialog> createState() => _GenderDialogState();
}

class _GenderDialogState extends State<GenderDialog> {
  TextEditingController genderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    genderController.text = widget.gender;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '性別',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            controller: genderController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateUser({
                    'gender': genderController.text.trim(),
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

class AddressDialog extends StatefulWidget {
  final String zip;
  final String address;

  const AddressDialog({
    required this.zip,
    required this.address,
    Key? key,
  }) : super(key: key);

  @override
  State<AddressDialog> createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  TextEditingController zipController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    zipController.text = widget.zip;
    addressController.text = widget.address;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '郵便番号',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: true,
            textInputAction: TextInputAction.next,
            controller: zipController,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          const Text(
            '住所',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: false,
            textInputAction: TextInputAction.done,
            controller: addressController,
            textInputType: TextInputType.streetAddress,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateUser({
                    'zip': zipController.text.trim(),
                    'address': addressController.text.trim(),
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

class Address2Dialog extends StatefulWidget {
  final String zip2;
  final String address2;

  const Address2Dialog({
    required this.zip2,
    required this.address2,
    Key? key,
  }) : super(key: key);

  @override
  State<Address2Dialog> createState() => _Address2DialogState();
}

class _Address2DialogState extends State<Address2Dialog> {
  TextEditingController zip2Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    zip2Controller.text = widget.zip2;
    address2Controller.text = widget.address2;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '郵便番号',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: true,
            textInputAction: TextInputAction.next,
            controller: zip2Controller,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          const Text(
            '住所',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: false,
            textInputAction: TextInputAction.done,
            controller: address2Controller,
            textInputType: TextInputType.streetAddress,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateUser({
                    'zip2': zip2Controller.text.trim(),
                    'address2': address2Controller.text.trim(),
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

class TelDialog extends StatefulWidget {
  final String tel;

  const TelDialog({
    required this.tel,
    Key? key,
  }) : super(key: key);

  @override
  State<TelDialog> createState() => _TelDialogState();
}

class _TelDialogState extends State<TelDialog> {
  TextEditingController telController = TextEditingController();

  @override
  void initState() {
    super.initState();
    telController.text = widget.tel;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '携帯電話番号',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            controller: telController,
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateUser({
                    'tel': telController.text.trim(),
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

class Tel2Dialog extends StatefulWidget {
  final String tel2;

  const Tel2Dialog({
    required this.tel2,
    Key? key,
  }) : super(key: key);

  @override
  State<Tel2Dialog> createState() => _Tel2DialogState();
}

class _Tel2DialogState extends State<Tel2Dialog> {
  TextEditingController tel2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    tel2Controller.text = widget.tel2;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '自宅電話番号',
            style: TextStyle(fontSize: 14),
          ),
          CustomTextField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            controller: tel2Controller,
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                labelText: '保存する',
                backgroundColor: Colors.blue,
                onPressed: () async {
                  await DBController.updateUser({
                    'tel2': tel2Controller.text.trim(),
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
