import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:resume_memo_app/helpers/pdf_creator.dart';
import 'package:resume_memo_app/helpers/save_helper.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({Key? key}) : super(key: key);

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PdfPreview(
        build: (format) async {
          final pdf = await PdfCreator.create();
          return await pdf.save();
        },
        initialPageFormat: PdfPageFormat.a3,
        allowPrinting: true,
        allowSharing: true,
        maxPageWidth: double.infinity,
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        loadingWidget: const LinearProgressIndicator(),
        actions: [
          PdfPreviewAction(
            icon: const Icon(Icons.download),
            onPressed: (context, build, format) async {
              await SaveHelper.save(
                bytes: await build(format),
                platform: Theme.of(context).platform,
              );
            },
          ),
        ],
      ),
    );
  }
}
