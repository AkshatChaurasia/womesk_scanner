import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> startImageCropping(
    BuildContext context, ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedXFile = await picker.pickImage(
    source: source,
  );
  if (pickedXFile == null) {
    return null;
  }

  final CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: pickedXFile.path,
    aspectRatioPresets: <CropAspectRatioPreset>[
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: <PlatformUiSettings>[
      AndroidUiSettings(
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
        statusBarColor: Colors.blue,
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        activeControlsWidgetColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.blueAccent,
      ),
      IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    ],
  );
  return File(croppedFile!.path);
}
