
//@dart=2.9
import 'package:devolopment/02_Drawer_list_items/notification_page/enums.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title;
  String imageSource;

  MenuInfo(this.menuType, {this.title, this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

//Important
    notifyListeners();
  }
}
