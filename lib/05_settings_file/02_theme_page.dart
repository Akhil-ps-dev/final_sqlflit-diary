//@dart=2.9
import 'package:devolopment/05_settings_file/01icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Theme',
        subtitle: 'Change Your App Theme',
        // leading: IconWidgets(
        //   icon: Icons.person,
        // ),
        child: SettingsScreen(
          title: 'Theme Settings',
          children: <Widget>[
            buildRed(context),
            buildBlue(context),
            buildGreen(context),
            buildYellow(context),
          ],
        ),
      );
  Widget buildRed(BuildContext context) => SimpleSettingsTile(
        title: 'Red',
        subtitle: '',
        leading: IconWidgets(
          icon: Icons.color_lens,
          color: Colors.redAccent,
        ),
        onTap: () {},
      );
  Widget buildBlue(BuildContext context) => SimpleSettingsTile(
        title: 'Blue',
        subtitle: '',
        leading: IconWidgets(
          icon: Icons.color_lens,
          color: Colors.blueAccent,
        ),
        onTap: () {},
      );
  Widget buildGreen(BuildContext context) => SimpleSettingsTile(
        title: 'Green',
        subtitle: '',
        leading: IconWidgets(
          icon: Icons.color_lens,
          color: Colors.greenAccent,
        ),
        onTap: () {},
      );
  Widget buildYellow(BuildContext context) => SimpleSettingsTile(
        title: 'Yellow',
        subtitle: '',
        leading: IconWidgets(
          icon: Icons.color_lens,
          color: Colors.yellowAccent,
        ),
        onTap: () {},
      );
}
