import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';

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
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    LanguageBuilder.changeLanguage('th', context);
                  });
                },

                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const Text(
                        'Thai',
                        style: TextStyle(color: Colors.black),
                      ),
                      const Spacer(),
                      (LanguageBuilder.getCurrentLang() == 'th')
                          ? const Icon(Icons.check, color: Colors.black)
                          : const Icon(null)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    LanguageBuilder.changeLanguage('en', context);
                  });
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const Text(
                        'English',
                        style: TextStyle(color: Colors.black),
                      ),
                      const Spacer(),
                      (LanguageBuilder.getCurrentLang() == 'en')
                          ? const Icon(Icons.check, color: Colors.black)
                          : const Icon(null)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
