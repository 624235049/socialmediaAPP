import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/feature/language_screen/ui/language_screen.dart';
import 'package:mfecinternship/utils/theme.dart';

class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;

  const Menu({
    required this.title,
    required this.icon,
    this.iconColor = Colors.grey,
    required this.onTap,
  });
}
class MenuViewModel {
  MenuViewModel();

  List<Menu> get items => <Menu>[
        Menu(
          title: LanguageBuilder.texts!['home_drawer']['home_page'],
          icon: Icons.home,
          iconColor: AppTheme.buttonBackgroundColor,
          onTap: (context) {},
        ),
        Menu(
          title: LanguageBuilder.texts!['home_drawer']['about_page'],
          icon: Icons.home_repair_service_sharp,
          iconColor: AppTheme.buttonBackgroundColor,
          onTap: (context) {},
        ),
    Menu(
      title: LanguageBuilder.texts!['home_drawer']['term_page'],
      icon: Icons.language,
      iconColor: AppTheme.buttonBackgroundColor,
      onTap: (context) {},
    ),
        Menu(
          title: LanguageBuilder.texts!['home_drawer']['language_page'],
          icon: Icons.import_contacts,
          iconColor: AppTheme.buttonBackgroundColor,
          onTap: (context) {
            Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const LanguageScreen();
              })).then((value) => LanguageBuilder.changeLanguage(LanguageBuilder.getCurrentLang(), context))
              
              ;
          },
        ),
      ];
}
