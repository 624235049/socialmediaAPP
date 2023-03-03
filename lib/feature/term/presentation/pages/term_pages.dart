import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/utils/theme.dart';

class TermPages extends StatelessWidget {
  const TermPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          LanguageBuilder.texts!['term_page']['term_title'],
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                LanguageBuilder.texts!['register_term']['term_head'],
                style: AppTheme.h5Style,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
              initialValue: LanguageBuilder.texts!['register_term']
                  ['term_text'],
              enabled: false,
              maxLines: 20,
              decoration: InputDecoration(
                labelText: LanguageBuilder.texts!['register_term']
                    ['term_field'],
                contentPadding: const EdgeInsets.all(16),
                border: const OutlineInputBorder(),
                floatingLabelBehavior:
                    FloatingLabelBehavior.always, // set always to show label
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
