import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mfecinternship/utils/theme.dart';

import 'image_select.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String _postMessage = '';
  final _formKey = GlobalKey<FormState>();


  File? _selectedImage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "เขียนโพสต์",
          style: AppTheme.titleStyle,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                // Submit the form data
                print('Post message: $_postMessage');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'โพสต์',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                              AssetImage('asset/images/login/real-photo.png'),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Your Name',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'What\'s on your mind?',
                      ),
                      maxLines: 30,
                      onChanged: (value) {
                        setState(() {
                          _postMessage = value;
                        });
                      },
                    ),
                    if (_selectedImage != null)
                      Image.file(
                        _selectedImage!,
                        height: 200,
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: ()  {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyGalleryPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.photo,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
