import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


Future<void> showImagePickerDialog(BuildContext context) async {
  final picker = ImagePicker();
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: const Text('เปิดกล้อง'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await picker.getImage(
                    source: ImageSource.camera,
                  );
                  // Do something with the image file
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                child: const Text('เลือกรูป'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile = await picker.getImage(
                    source: ImageSource.gallery,
                  );
                  // Do something with the image file
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}