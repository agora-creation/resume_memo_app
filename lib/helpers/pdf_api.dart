import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_memo_app/helpers/file_handle_api.dart';

class PdfApi {
  static Future<File> generate() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageTheme: const pw.PageTheme(
          pageFormat: PdfPageFormat.a4,
          orientation: pw.PageOrientation.landscape,
        ),
        build: (context) {
          return [
            pw.Column(
              children: [
                pw.Text('履歴書'),
              ],
            ),
          ];
        },
      ),
    );
    return FileHandleApi.saveDocument(name: 'my_resume.pdf', pdf: pdf);
  }
}
