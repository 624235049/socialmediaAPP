import 'package:flutter/material.dart';
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
          title: 'หน้าแรก',
          icon: Icons.home,
          iconColor: AppTheme.buttonBackgroundColor,
          onTap: (context) {},
        ),
        Menu(
          title: 'เกี่ยวกับ MFEC',
          icon: Icons.home_repair_service_sharp,
          iconColor: AppTheme.buttonBackgroundColor,
          onTap: (context) {},
        ),
    Menu(
      title: 'เปลี่ยนภาษา',
      icon: Icons.language,
      iconColor: AppTheme.buttonBackgroundColor,
      onTap: (context) {},
    ),
        Menu(
          title: 'เงื่อนไขและข้อตกลง',
          icon: Icons.import_contacts,
          iconColor: AppTheme.buttonBackgroundColor,
          onTap: (context) {},
        ),
      ];
}
