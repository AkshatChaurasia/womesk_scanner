import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:womesk_scanner/screens/preview_pdf.dart';
import '../service/img_pick_crop.dart';

class Womesk extends StatefulWidget {
  const Womesk({Key? key}) : super(key: key);

  @override
  State<Womesk> createState() => _WomeskState();
}

class _WomeskState extends State<Womesk> {
  File? cameraImg;

  File? galleryImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "WOMESK",
            textAlign: TextAlign.justify,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                galleryImg = await startImageCropping(
                  context,
                  ImageSource.gallery,
                );
                if (galleryImg != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewPDF(
                        cameraImg: galleryImg,
                      ),
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.image,
                color: Colors.green,
              ),
              iconSize: 150,
            ),
            const SizedBox(
              height: 50.0,
            ),
            IconButton(
              onPressed: () async {
                cameraImg =
                    await startImageCropping(context, ImageSource.camera);
                if (cameraImg != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewPDF(
                        cameraImg: cameraImg,
                      ),
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.camera,
                color: Colors.lightBlue,
              ),
              iconSize: 150,
            ),
          ],
        ),
      ),
    );
  }
}
