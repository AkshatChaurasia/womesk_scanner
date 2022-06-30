import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generatePdf(PdfPageFormat format, file) async {
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
  final showimage = pw.MemoryImage(file.readAsBytesSync());

  pdf.addPage(
    pw.Page(
      pageFormat: format,
      build: (context) {
        return pw.Center(
          child: pw.Image(showimage, fit: pw.BoxFit.contain),
        );
      },
    ),
  );

  return pdf.save();
}
