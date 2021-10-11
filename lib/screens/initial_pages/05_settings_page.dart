//@dart=2.9

import 'package:devolopment/05_settings_file/01_account_page.dart';
import 'package:devolopment/05_settings_file/01icon_widget.dart';
import 'package:devolopment/05_settings_file/02_theme_page.dart';
import 'package:devolopment/05_settings_file/03_font_page.dart';
import 'package:devolopment/05_settings_file/04_lockscreen_page.dart';
import 'package:devolopment/05_settings_file/notification_page/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'Settings ',
        //     style: TextStyle(fontFamily: "lato"),
        //   ),
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
              SettingsGroup(
                title: 'General',
                children: <Widget>[
                  AccountPage(),

                  //  buildNotification(),
                ],
              ),
              const SizedBox(height: 32),
              SettingsGroup(
                title: "Settings",
                children: <Widget>[
                  //!

                  ThemePage(),
                  FontPage(),
                  NotificationPage(),

                  //!
                  const SizedBox(
                    height: 30,
                  ),
                  buildReportBug(context),
                  const SizedBox(
                    height: 10,
                  ),
                  buildSendFeedback(context),
                  const SizedBox(
                    height: 10,
                  ),
                  buildShare(context),
                  const SizedBox(
                    height: 10,
                  ),
                  buildHelp(context),
                  const SizedBox(
                    height: 90,
                  ),
                  buildLogout(),
                ],
              ),
            ],
          ),
        ),
      );
//?list btw general and settings
  // Widget buildNotification() => SimpleSettingsTile(
  //       title: 'Notifications',
  //       subtitle: '',
  //       // leading: IconWidgets(
  //       //   icon: Icons.message,
  //       // ),
  //       onTap: () {},
  //     );

  Widget buildReportBug(BuildContext context) => SimpleSettingsTile(
        title: 'Lock Screen',
        subtitle: '',
        // leading: IconWidgets(
        //   icon: Icons.bug_report,
        // ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LockScreen(),
            )),
      );

  Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
        title: 'Send Feedback',
        subtitle: '',
        // leading: IconWidgets(
        //   icon: Icons.star,
        // ),
        onTap: () {},
      );

  Widget buildShare(BuildContext context) => SimpleSettingsTile(
        title: 'Share App',
        subtitle: '',
        // leading: IconWidgets(
        //   icon: Icons.share,
        // ),
        onTap: () {},
      );

  Widget buildHelp(BuildContext context) => SimpleSettingsTile(
        title: 'Help',
        subtitle: '',
        // leading: IconWidgets(
        //   icon: Icons.help,
        // ),
        onTap: () {},
      );

  Widget buildLogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: IconWidgets(
          icon: Icons.logout,
        ),
        onTap: () {},
      );
}
