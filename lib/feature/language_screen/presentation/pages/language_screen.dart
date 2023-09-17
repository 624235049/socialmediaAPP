import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:socialMediaApp/utils/theme.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            LanguageBuilder.texts!['language_page']['language_title'],
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0
                ),
                onPressed: () {
                  setState(() {
                    LanguageBuilder.changeLanguage('th', context);
                  });
                },
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Text(
                          'Thai',
                          style: TextStyle(color: AppTheme.aboutTitle, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        (LanguageBuilder.getCurrentLang() == 'th')
                            ? const Icon(Icons.check, color: AppTheme.aboutTitle)
                            : const Icon(null)
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 2,
                  color: AppTheme.dividerPost,
                  thickness: 1,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0
                ),
                onPressed: () {
                  setState(() {
                    LanguageBuilder.changeLanguage('en', context);
                  });
                },
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Text(
                          'English',
                          style: TextStyle(color: AppTheme.aboutTitle, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        (LanguageBuilder.getCurrentLang() == 'en')
                            ? const Icon(Icons.check, color: AppTheme.aboutTitle)
                            : const Icon(null)
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 2,
                  color: AppTheme.dividerPost,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ));
  }
}
