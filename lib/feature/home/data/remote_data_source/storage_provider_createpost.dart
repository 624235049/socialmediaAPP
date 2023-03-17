import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageProviderRemoteDataSourceCreatePost {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<List<String>> uploadFiles({required List<File> files}) async {
    List<String> imageUrls = [];

    for (File file in files) {
      final ref = _storage.ref().child(
          "images/${DateTime.now().millisecondsSinceEpoch}${getNameOnly(file.path)}");
      print("file ${file.path}");

      final uploadTask = ref.putFile(file);

      final imageUrl = (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
      imageUrls.add(await imageUrl);
    }

    return imageUrls;
  }

  static String getNameOnly(String path) {
    return path.split('/').last.split('%').last.split("?").first;
  }
}