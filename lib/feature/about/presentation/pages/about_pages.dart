import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/utils/theme.dart';

class AboutPages extends StatefulWidget {
  const AboutPages({Key? key}) : super(key: key);

  @override
  State<AboutPages> createState() => _AboutPagesState();
}

class _AboutPagesState extends State<AboutPages> {
  bool showHistory = false;
  bool showVision = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          LanguageBuilder.texts!['about_page']['about_title'],
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            children: [
              historyDetail(),
              visionDetail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget visionDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TextButton(
              onPressed: () {
                setState(() {
                  showVision = !showVision;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(LanguageBuilder.texts!['about_page']['vision_title'],
                      style: const TextStyle(fontSize: 14)),
                  (showVision == false)
                      ? const Icon(Icons.keyboard_arrow_down)
                      : const Icon(Icons.keyboard_arrow_up)
                ],
              )),
        ),
        const Divider(
          color: Color(0xFF99CCFF),
          thickness: 1,
          height: 0,
        ),
        (showVision == true)
            ? Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      LanguageBuilder.texts!['about_page']
                          ['vision_detail_1_title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          fontSize: 16),
                    ),
                    Text(
                      LanguageBuilder.texts!['about_page']['vision_detail_1'],
                      style: const TextStyle(height: 1.5, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      LanguageBuilder.texts!['about_page']
                          ['vision_detail_2_title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          fontSize: 16),
                    ),
                    Text(
                      LanguageBuilder.texts!['about_page']['vision_detail_2'],
                      style: const TextStyle(height: 1.5, fontSize: 16),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget historyDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
          child: TextButton(
              onPressed: () {
                setState(() {
                  showHistory = !showHistory;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(LanguageBuilder.texts!['about_page']['history_title'],
                      style: const TextStyle(fontSize: 14)),
                  (showHistory == false)
                      ? const Icon(Icons.keyboard_arrow_down)
                      : const Icon(Icons.keyboard_arrow_up)
                ],
              )),
        ),
        const Divider(
          color: Color(0xFF99CCFF),
          thickness: 1,
          height: 0,
        ),
        (showHistory == true)
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                    LanguageBuilder.texts!['about_page']['history_detail'],
                    style: const TextStyle(fontSize: 16)),
              )
            : const SizedBox(),
      ],
    );
  }
}
