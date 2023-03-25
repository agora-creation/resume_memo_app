import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_memo_app/helpers/db_controller.dart';
import 'package:resume_memo_app/helpers/file_handle_api.dart';
import 'package:resume_memo_app/helpers/functions.dart';

class PdfApi {
  static Future<File> generate() async {
    final fontBase = await PdfGoogleFonts.shipporiMinchoRegular();
    final fontBold = await PdfGoogleFonts.shipporiMinchoBold();
    final borderStyle = pw.TableBorder.all(color: PdfColors.grey);
    final titleStyle = pw.TextStyle(
      fontSize: 18,
      fontWeight: pw.FontWeight.bold,
    );
    const nowStyle = pw.TextStyle(fontSize: 10);
    const smallStyle = pw.TextStyle(fontSize: 10);
    const nameStyle = pw.TextStyle(fontSize: 20);
    const mediumStyle = pw.TextStyle(fontSize: 14);
    const addressStyle = pw.TextStyle(fontSize: 16);
    const telStyle = pw.TextStyle(fontSize: 16);
    const listStyle = pw.TextStyle(fontSize: 14);
    final pdf = pw.Document();
    Uint8List userImage = (await rootBundle.load('assets/images/noimage.png'))
        .buffer
        .asUint8List();
    Map<String, dynamic>? userData;
    final dataUser = await DBController.selectUser();
    userData = dataUser.single;
    String imagePath = userData['image'] ?? '';
    if (imagePath != '') {
      userImage = (await rootBundle.load(imagePath)).buffer.asUint8List();
    }
    String birthDate = userData['birthDate'] ?? '';
    String birth = '----年--月--日';
    String age = '--';
    if (birthDate != '') {
      DateTime tmp = DateTime.parse(birthDate);
      birth = dateText('yyyy年MM月dd日', tmp);
      age = AgeCalculator.age(tmp).years.toString();
    }
    List<Map<String, dynamic>> historyData = [];
    final dataHistory = await DBController.selectHistory();
    historyData = dataHistory;
    String month0Text = '';
    String value0Text = '';
    String month1Text = '';
    String value1Text = '';
    String month2Text = '';
    String value2Text = '';
    String month3Text = '';
    String value3Text = '';
    String month4Text = '';
    String value4Text = '';
    String month5Text = '';
    String value5Text = '';
    String month6Text = '';
    String value6Text = '';
    String month7Text = '';
    String value7Text = '';
    String month8Text = '';
    String value8Text = '';
    String month9Text = '';
    String value9Text = '';
    String month10Text = '';
    String value10Text = '';
    String month11Text = '';
    String value11Text = '';
    String month12Text = '';
    String value12Text = '';
    String month13Text = '';
    String value13Text = '';
    String month14Text = '';
    String value14Text = '';
    String month15Text = '';
    String value15Text = '';
    String month16Text = '';
    String value16Text = '';
    String month17Text = '';
    String value17Text = '';
    String month18Text = '';
    String value18Text = '';
    String month19Text = '';
    String value19Text = '';
    int cnt = 0;
    for (Map<String, dynamic> h in historyData) {
      switch (cnt) {
        case 0:
          DateTime month = DateTime.parse(h['month']);
          month0Text = dateText('yyyy年MM月', month);
          value0Text = h['memo'] ?? '';
          break;
        case 1:
          DateTime month = DateTime.parse(h['month']);
          month1Text = dateText('yyyy年MM月', month);
          value1Text = h['memo'] ?? '';
          break;
        case 2:
          DateTime month = DateTime.parse(h['month']);
          month2Text = dateText('yyyy年MM月', month);
          value2Text = h['memo'] ?? '';
          break;
        case 3:
          DateTime month = DateTime.parse(h['month']);
          month3Text = dateText('yyyy年MM月', month);
          value3Text = h['memo'] ?? '';
          break;
        case 4:
          DateTime month = DateTime.parse(h['month']);
          month4Text = dateText('yyyy年MM月', month);
          value4Text = h['memo'] ?? '';
          break;
        case 5:
          DateTime month = DateTime.parse(h['month']);
          month5Text = dateText('yyyy年MM月', month);
          value5Text = h['memo'] ?? '';
          break;
        case 6:
          DateTime month = DateTime.parse(h['month']);
          month6Text = dateText('yyyy年MM月', month);
          value6Text = h['memo'] ?? '';
          break;
        case 7:
          DateTime month = DateTime.parse(h['month']);
          month7Text = dateText('yyyy年MM月', month);
          value7Text = h['memo'] ?? '';
          break;
        case 8:
          DateTime month = DateTime.parse(h['month']);
          month8Text = dateText('yyyy年MM月', month);
          value8Text = h['memo'] ?? '';
          break;
        case 9:
          DateTime month = DateTime.parse(h['month']);
          month9Text = dateText('yyyy年MM月', month);
          value9Text = h['memo'] ?? '';
          break;
        case 10:
          DateTime month = DateTime.parse(h['month']);
          month10Text = dateText('yyyy年MM月', month);
          value10Text = h['memo'] ?? '';
          break;
        case 11:
          DateTime month = DateTime.parse(h['month']);
          month11Text = dateText('yyyy年MM月', month);
          value11Text = h['memo'] ?? '';
          break;
        case 12:
          DateTime month = DateTime.parse(h['month']);
          month12Text = dateText('yyyy年MM月', month);
          value12Text = h['memo'] ?? '';
          break;
        case 13:
          DateTime month = DateTime.parse(h['month']);
          month13Text = dateText('yyyy年MM月', month);
          value13Text = h['memo'] ?? '';
          break;
        case 14:
          DateTime month = DateTime.parse(h['month']);
          month14Text = dateText('yyyy年MM月', month);
          value14Text = h['memo'] ?? '';
          break;
        case 15:
          DateTime month = DateTime.parse(h['month']);
          month15Text = dateText('yyyy年MM月', month);
          value15Text = h['memo'] ?? '';
          break;
        case 16:
          DateTime month = DateTime.parse(h['month']);
          month16Text = dateText('yyyy年MM月', month);
          value16Text = h['memo'] ?? '';
          break;
        case 17:
          DateTime month = DateTime.parse(h['month']);
          month17Text = dateText('yyyy年MM月', month);
          value17Text = h['memo'] ?? '';
          break;
        case 18:
          DateTime month = DateTime.parse(h['month']);
          month18Text = dateText('yyyy年MM月', month);
          value18Text = h['memo'] ?? '';
          break;
        case 19:
          DateTime month = DateTime.parse(h['month']);
          month19Text = dateText('yyyy年MM月', month);
          value19Text = h['memo'] ?? '';
          break;
      }
      cnt++;
    }
    List<Map<String, dynamic>> licenseData = [];
    final dataLicense = await DBController.selectLicense();
    licenseData = dataLicense;
    String month20Text = '';
    String value20Text = '';
    String month21Text = '';
    String value21Text = '';
    String month22Text = '';
    String value22Text = '';
    String month23Text = '';
    String value23Text = '';
    String month24Text = '';
    String value24Text = '';
    String month25Text = '';
    String value25Text = '';
    int cnt2 = 0;
    for (Map<String, dynamic> l in licenseData) {
      switch (cnt2) {
        case 0:
          DateTime month = DateTime.parse(l['month']);
          month20Text = dateText('yyyy年MM月', month);
          value20Text = l['memo'] ?? '';
          break;
        case 1:
          DateTime month = DateTime.parse(l['month']);
          month21Text = dateText('yyyy年MM月', month);
          value21Text = l['memo'] ?? '';
          break;
        case 2:
          DateTime month = DateTime.parse(l['month']);
          month22Text = dateText('yyyy年MM月', month);
          value22Text = l['memo'] ?? '';
          break;
        case 3:
          DateTime month = DateTime.parse(l['month']);
          month23Text = dateText('yyyy年MM月', month);
          value23Text = l['memo'] ?? '';
          break;
        case 4:
          DateTime month = DateTime.parse(l['month']);
          month24Text = dateText('yyyy年MM月', month);
          value24Text = l['memo'] ?? '';
          break;
        case 5:
          DateTime month = DateTime.parse(l['month']);
          month25Text = dateText('yyyy年MM月', month);
          value25Text = l['memo'] ?? '';
          break;
      }
      cnt2++;
    }
    Map<String, dynamic>? motivationData;
    final dataMotivation = await DBController.selectMotivation();
    motivationData = dataMotivation.single;
    String memo = motivationData['memo'] ?? '';
    String memo2 = motivationData['memo2'] ?? '';
    String memoText1 = '';
    String memoText2 = '';
    String memoText3 = '';
    String memoText4 = '';
    String memo2Text1 = '';
    String memo2Text2 = '';
    String memo2Text3 = '';
    String memo2Text4 = '';
    if (memo.length >= 140) {
      memoText1 = memo.substring(0, 34);
      memoText2 = memo.substring(35, 69);
      memoText3 = memo.substring(70, 104);
      memoText4 = memo.substring(105, 139);
    } else if (memo.length < 140 && memo.length >= 105) {
      memoText1 = memo.substring(0, 34);
      memoText2 = memo.substring(35, 69);
      memoText3 = memo.substring(70, 104);
      memoText4 = memo.substring(105, memo.length);
    } else if (memo.length < 105 && memo.length >= 70) {
      memoText1 = memo.substring(0, 34);
      memoText2 = memo.substring(35, 69);
      memoText3 = memo.substring(70, memo.length);
    } else if (memo.length < 70 && memo.length >= 35) {
      memoText1 = memo.substring(0, 34);
      memoText2 = memo.substring(35, memo.length);
    } else if (memo.length < 35) {
      memoText1 = memo.substring(0, memo.length);
    }
    if (memo2.length >= 140) {
      memo2Text1 = memo2.substring(0, 34);
      memo2Text2 = memo2.substring(35, 69);
      memo2Text3 = memo2.substring(70, 104);
      memo2Text4 = memo2.substring(105, 139);
    } else if (memo2.length < 140 && memo2.length >= 105) {
      memo2Text1 = memo2.substring(0, 34);
      memo2Text2 = memo2.substring(35, 69);
      memo2Text3 = memo2.substring(70, 104);
      memo2Text4 = memo2.substring(105, memo2.length);
    } else if (memo2.length < 105 && memo2.length >= 70) {
      memo2Text1 = memo2.substring(0, 34);
      memo2Text2 = memo2.substring(35, 69);
      memo2Text3 = memo2.substring(70, memo2.length);
    } else if (memo2.length < 70 && memo2.length >= 35) {
      memo2Text1 = memo2.substring(0, 34);
      memo2Text2 = memo2.substring(35, memo2.length);
    } else if (memo2.length < 35) {
      memo2Text1 = memo2.substring(0, memo2.length);
    }

    pw.Row generateTitle() {
      DateTime now = DateTime.now();
      return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text(
            '履　歴　書',
            style: titleStyle,
          ),
          pw.Text(
            '${dateText('yyyy年MM月dd日', now)}　現在',
            style: nowStyle,
          )
        ],
      );
    }

    pw.Table generateName() {
      return pw.Table(
        border: borderStyle,
        children: [
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Row(
                  children: [
                    pw.Text(
                      'ふりがな',
                      style: smallStyle,
                    ),
                    pw.SizedBox(width: 16),
                    pw.Text(
                      '${userData?['nameRuby'] ?? ''}',
                      style: smallStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      '氏　名',
                      style: smallStyle,
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 4),
                      child: userData?['name'] != ''
                          ? pw.Text(
                              userData?['name'],
                              style: nameStyle,
                              maxLines: 1,
                            )
                          : pw.Text(
                              'テスト',
                              style: nameStyle.copyWith(
                                color: PdfColors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    pw.Image generateImage() {
      return pw.Image(
        width: 80,
        height: 120,
        pw.MemoryImage(userImage),
      );
    }

    pw.Table generateBirth() {
      return pw.Table(
        border: borderStyle,
        children: [
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Row(
                  children: [
                    pw.Text(
                      '生年月日',
                      style: mediumStyle,
                    ),
                    pw.SizedBox(width: 16),
                    pw.Text(
                      '$birth　(満$age歳)',
                      style: mediumStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Row(
                  children: [
                    pw.Text(
                      '性別',
                      style: mediumStyle,
                    ),
                    pw.SizedBox(width: 16),
                    pw.Text(
                      '${userData?['gender'] ?? ''}',
                      style: mediumStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    pw.Table generateAddress() {
      return pw.Table(
        border: borderStyle,
        children: [
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Row(
                  children: [
                    pw.Text(
                      'ふりがな',
                      style: smallStyle,
                    ),
                    pw.SizedBox(width: 16),
                    pw.Text(
                      '',
                      style: smallStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      children: [
                        pw.Text(
                          '現住所',
                          style: smallStyle,
                        ),
                        pw.SizedBox(width: 16),
                        pw.Text(
                          '〒${userData?['zip'] ?? ''}',
                          style: smallStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    userData?['address'] != ''
                        ? pw.Text(
                            userData?['address'],
                            style: addressStyle,
                            maxLines: 1,
                          )
                        : pw.Text(
                            'テスト',
                            style: addressStyle.copyWith(
                              color: PdfColors.white,
                            ),
                          ),
                  ],
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.SizedBox(
                  width: 20,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        '電話',
                        style: smallStyle,
                      ),
                      userData?['tel'] != ''
                          ? pw.Text(
                              userData?['tel'],
                              style: telStyle,
                              maxLines: 1,
                            )
                          : pw.Text(
                              'テスト',
                              style: telStyle.copyWith(
                                color: PdfColors.white,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Row(
                  children: [
                    pw.Text(
                      'ふりがな',
                      style: smallStyle,
                    ),
                    pw.SizedBox(width: 24),
                    pw.Text(
                      '',
                      style: addressStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      children: [
                        pw.Text(
                          '連絡先',
                          style: smallStyle,
                        ),
                        pw.SizedBox(width: 16),
                        pw.Text(
                          '〒${userData?['zip2'] ?? ''}',
                          style: smallStyle,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    userData?['address2'] != ''
                        ? pw.Text(
                            userData?['address2'],
                            style: addressStyle,
                            maxLines: 1,
                          )
                        : pw.Text(
                            'テスト',
                            style: addressStyle.copyWith(
                              color: PdfColors.white,
                            ),
                          ),
                  ],
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.SizedBox(
                  width: 20,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        '電話',
                        style: smallStyle,
                      ),
                      userData?['tel2'] != ''
                          ? pw.Text(
                              userData?['tel2'],
                              style: telStyle,
                              maxLines: 1,
                            )
                          : pw.Text(
                              'テスト',
                              style: telStyle.copyWith(
                                color: PdfColors.white,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    pw.Table generateHistory1() {
      return pw.Table(
        border: borderStyle,
        children: [
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 16,
                child: pw.Text(
                  '年月',
                  style: listStyle,
                ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Text(
                  '学歴・職歴',
                  style: listStyle,
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month0Text != ''
                    ? pw.Text(
                        month0Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value0Text != ''
                    ? pw.Text(
                        value0Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month1Text != ''
                    ? pw.Text(
                        month1Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value1Text != ''
                    ? pw.Text(
                        value1Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month2Text != ''
                    ? pw.Text(
                        month2Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value2Text != ''
                    ? pw.Text(
                        value2Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month3Text != ''
                    ? pw.Text(
                        month3Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value3Text != ''
                    ? pw.Text(
                        value3Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month4Text != ''
                    ? pw.Text(
                        month4Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value4Text != ''
                    ? pw.Text(
                        value4Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month5Text != ''
                    ? pw.Text(
                        month5Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value5Text != ''
                    ? pw.Text(
                        value5Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month6Text != ''
                    ? pw.Text(
                        month6Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value6Text != ''
                    ? pw.Text(
                        value6Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month7Text != ''
                    ? pw.Text(
                        month7Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value7Text != ''
                    ? pw.Text(
                        value7Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month8Text != ''
                    ? pw.Text(
                        month8Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value8Text != ''
                    ? pw.Text(
                        value8Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month9Text != ''
                    ? pw.Text(
                        month9Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value9Text != ''
                    ? pw.Text(
                        value9Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month10Text != ''
                    ? pw.Text(
                        month10Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value10Text != ''
                    ? pw.Text(
                        value10Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month11Text != ''
                    ? pw.Text(
                        month11Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value11Text != ''
                    ? pw.Text(
                        value11Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month12Text != ''
                    ? pw.Text(
                        month12Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value12Text != ''
                    ? pw.Text(
                        value12Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month13Text != ''
                    ? pw.Text(
                        month13Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value13Text != ''
                    ? pw.Text(
                        value13Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
        ],
      );
    }

    pw.Table generateHistory2() {
      return pw.Table(
        border: borderStyle,
        children: [
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 16,
                child: pw.Text(
                  '年月',
                  style: listStyle,
                ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Text(
                  '学歴・職歴',
                  style: listStyle,
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month14Text != ''
                    ? pw.Text(
                        month14Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value14Text != ''
                    ? pw.Text(
                        value14Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month15Text != ''
                    ? pw.Text(
                        month15Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value15Text != ''
                    ? pw.Text(
                        value15Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month16Text != ''
                    ? pw.Text(
                        month16Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value16Text != ''
                    ? pw.Text(
                        value16Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month17Text != ''
                    ? pw.Text(
                        month17Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value17Text != ''
                    ? pw.Text(
                        value17Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month18Text != ''
                    ? pw.Text(
                        month18Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value18Text != ''
                    ? pw.Text(
                        value18Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month19Text != ''
                    ? pw.Text(
                        month19Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value19Text != ''
                    ? pw.Text(
                        value19Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 16,
                child: pw.Text(
                  '年月',
                  style: listStyle,
                ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Text(
                  '免許・資格',
                  style: listStyle,
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month20Text != ''
                    ? pw.Text(
                        month20Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value20Text != ''
                    ? pw.Text(
                        value20Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month21Text != ''
                    ? pw.Text(
                        month21Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value21Text != ''
                    ? pw.Text(
                        value21Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month22Text != ''
                    ? pw.Text(
                        month22Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value22Text != ''
                    ? pw.Text(
                        value22Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month23Text != ''
                    ? pw.Text(
                        month23Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value23Text != ''
                    ? pw.Text(
                        value23Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month24Text != ''
                    ? pw.Text(
                        month24Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value24Text != ''
                    ? pw.Text(
                        value24Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                width: 32,
                child: month25Text != ''
                    ? pw.Text(
                        month25Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: value25Text != ''
                    ? pw.Text(
                        value25Text,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
        ],
      );
    }

    pw.Table generateMotivation1() {
      return pw.Table(
        border: borderStyle,
        children: [
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Text(
                  '志望の動機、特技、好きな学科、アピールポイントなど',
                  style: mediumStyle,
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: memoText1 != ''
                    ? pw.Text(
                        memoText1,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: memoText2 != ''
                    ? pw.Text(
                        memoText2,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: memoText3 != ''
                    ? pw.Text(
                        memoText3,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: memoText4 != ''
                    ? pw.Text(
                        memoText4,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
        ],
      );
    }

    pw.Table generateMotivation2() {
      return pw.Table(
        border: borderStyle,
        children: [
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Text(
                  '本人希望記入欄 (特に給料・職種・勤務時間・勤務地・その他についての希望などがあれば記入)',
                  style: mediumStyle,
                ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: memo2Text1 != ''
                    ? pw.Text(
                        memo2Text1,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: memo2Text2 != ''
                    ? pw.Text(
                        memo2Text2,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: memo2Text3 != ''
                    ? pw.Text(
                        memo2Text3,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
          pw.TableRow(
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(4),
                child: memo2Text4 != ''
                    ? pw.Text(
                        memo2Text4,
                        style: listStyle,
                        maxLines: 1,
                      )
                    : pw.Text(
                        'テスト',
                        style: listStyle.copyWith(
                          color: PdfColors.white,
                        ),
                      ),
              ),
            ],
          ),
        ],
      );
    }

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          theme: pw.ThemeData.withFont(base: fontBase, bold: fontBold),
          pageFormat: PdfPageFormat.a3,
          orientation: pw.PageOrientation.landscape,
        ),
        build: (context) {
          return [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Expanded(
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                generateTitle(),
                                pw.SizedBox(height: 4),
                                generateName(),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: generateImage(),
                          ),
                        ],
                      ),
                      generateBirth(),
                      generateAddress(),
                      pw.SizedBox(height: 10),
                      generateHistory1(),
                    ],
                  ),
                ),
                pw.SizedBox(width: 60),
                pw.Expanded(
                  child: pw.Column(
                    children: [
                      generateHistory2(),
                      pw.SizedBox(height: 8),
                      generateMotivation1(),
                      pw.SizedBox(height: 8),
                      generateMotivation2(),
                    ],
                  ),
                ),
              ],
            ),
          ];
        },
      ),
    );
    return FileHandleApi.saveDocument(name: 'my_resume.pdf', pdf: pdf);
  }
}
