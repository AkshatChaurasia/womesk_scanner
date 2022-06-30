import 'dart:io';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:womesk_scanner/service/save_pdf.dart';

// ignore: must_be_immutable
class PreviewPDF extends StatefulWidget {
  File? cameraImg;
  PreviewPDF({this.cameraImg, Key? key}) : super(key: key);

  @override
  State<PreviewPDF> createState() => _PreviewPDFState();
}

class _PreviewPDFState extends State<PreviewPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Save as PDF'),
        leading: Builder(
          builder: (BuildContext context) {
            return const IconButtonWidget();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PdfPreview(
            build: (format) => generatePdf(
              format,
              widget.cameraImg,
            ),
          ),
        ),
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
