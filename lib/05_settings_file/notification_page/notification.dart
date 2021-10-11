//@dart=2.9
import 'package:devolopment/05_settings_file/01icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Notification',
        subtitle: 'Set Notification',
        // leading: IconWidgets(
        //   icon: Icons.person,
        // ),
        child: SettingsScreen(
  
          title: 'Notification Settings',
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            buildRed(context),
          ],
        ),
      );
  Widget buildRed(BuildContext context) => SimpleSettingsTile(
        title: 'Activate Notification',
        subtitle: '',
        leading: IconWidgets(
          icon: Icons.notifications_active,
          color: Colors.redAccent,
        ),
        onTap: () {},
      );
}
