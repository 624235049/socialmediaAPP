import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../utils/theme.dart';

class MyGalleryPage extends StatefulWidget {
  @override
  _MyGalleryPageState createState() => _MyGalleryPageState();
}

class _MyGalleryPageState extends State<MyGalleryPage> {
  List<AssetEntity> _images = [];

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );

    final List<AssetEntity> images =
        await albums[0].getAssetListRange(start: 0, end: 1000000);

    setState(() {
      _images = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "เลือกรูปภาพ",
          style: AppTheme.titleStyle,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          InkWell(
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'เพิ่ม',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.buttonBackgroundColor,
                  // กำหนดสีพื้นหลัง
                  onPrimary: Colors.white,
                  // กำหนดสีตัวอักษร
                  textStyle: TextStyle(fontSize: 14),
                  // กำหนดขนาดตัวอักษร
                  minimumSize: Size(50, 36),
                  // กำหนดขนาดของปุ่ม
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16), // กำหนดรูปร่างของปุ่ม
                  ),
                  visualDensity: VisualDensity.compact,
                  // ปรับความหนาแน่นของตัวองค์ประกอบในปุ่ม
                ),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: _images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () async {
              Uint8List? imageData = await _images[index].thumbData;
              if (imageData != null) {
                setState(() {
                  // _selectedImage = imageData;
                });
              }
            },
            child: FutureBuilder<Uint8List?>(
              future: _images[index].thumbData,
              builder:
                  (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  return Image.memory(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
