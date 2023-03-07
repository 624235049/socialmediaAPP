import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/utils/theme.dart';
import 'package:photo_manager/photo_manager.dart';
import 'gallery_pages.dart';

class CreatePost extends StatefulWidget {
  final List<AssetEntity> images;
  const CreatePost({Key? key, required this.images}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String _postMessage = '';
  final _formKey = GlobalKey<FormState>();
  List<AssetImage> images_groups = [];

  File? _selectedImage;
  @override
  void initState() {
    images_groups = widget.images.cast<AssetImage>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          LanguageBuilder.texts!['post_write_page']['post_title'],
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
                  LanguageBuilder.texts!['post_write_page']['post_button'],
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.buttonBackgroundColor,
                  // กำหนดสีพื้นหลัง
                  onPrimary: Colors.white,
                  // กำหนดสีตัวอักษร
                  textStyle: const TextStyle(fontSize: 14),
                  // กำหนดขนาดตัวอักษร
                  minimumSize: const Size(50, 36),
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
                      decoration: InputDecoration(
                        hintText: LanguageBuilder.texts!['post_write_page']['post_hint'],
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),

                      maxLines: null,
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
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 200, // set a fixed width for the container
                            child: FutureBuilder<Uint8List?>(
                              future: widget.images[index].thumbData,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                                  return Image.memory(
                                    snapshot.data!,
                                    height: 200,
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          );
                        },
                      ),
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
          ),
        ],
      ),
    );
  }
}
