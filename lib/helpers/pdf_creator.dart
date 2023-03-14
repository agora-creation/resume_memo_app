import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfCreator {
  static Future<Document> create() async {
    final fontData = await rootBundle.load(
      'assets/fonts/SourceHanSerif-Regular.otf',
    );
    final font = Font.ttf(fontData);

    final pdf = Document(author: 'Me');

    final content = MultiPage(
      pageTheme: PageTheme(
        theme: ThemeData.withFont(base: font),
        pageFormat: PdfPageFormat.a3,
        orientation: PageOrientation.landscape,
      ),
      build: (context) {
        return [
          Header(
            level: 0,
            textStyle: Theme.of(context).header0,
            child: Text(
              'shimamura',
              style: Theme.of(context).header3,
            ),
          ),
          Paragraph(
            style: Theme.of(context).paragraphStyle,
            text: 'yuta',
          ),
          Header(
            level: 0,
            textStyle: Theme.of(context).header0,
            child: Text(
              'shimamura',
              style: Theme.of(context).header3,
            ),
          ),
          Paragraph(
            style: Theme.of(context).paragraphStyle,
            text: 'yuta',
          ),
          Header(
            level: 0,
            textStyle: Theme.of(context).header0,
            child: Text(
              'shimamura',
              style: Theme.of(context).header3,
            ),
          ),
          Paragraph(
            style: Theme.of(context).paragraphStyle,
            text: 'yuta',
          ),
        ];
      },
    );

    pdf.addPage(content);
    return pdf;
  }
}
