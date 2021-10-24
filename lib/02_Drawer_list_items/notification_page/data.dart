//@dart=2.9

import 'package:devolopment/02_Drawer_list_items/notification_page/enums.dart';

import 'models/alarm_info.dart';
import 'models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 1)),
      title: 'Office',
      gradientColorIndex: 0),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      title: 'Sport',
      gradientColorIndex: 1),
];
