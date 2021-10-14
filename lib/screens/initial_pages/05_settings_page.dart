//@dart=2.9


import 'package:devolopment/05_settings_file/icon_widget/01icon_widget.dart';
import 'package:devolopment/05_settings_file/lock_screen_page/04_lockscreen_page.dart';
import 'package:devolopment/05_settings_file/font_page/03_font_page.dart';
import 'package:devolopment/05_settings_file/notification_page/01notification_page.dart';
import 'package:devolopment/05_settings_file/theme_page/02_theme_page.dart';
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
                //  AccountPage(),

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

                  //!
                  const SizedBox(
                    height: 30,
                  ),
                  buildSendNotification(context),
                  const SizedBox(
                    height: 10,
                  ),
                  buildLock(context),
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

  Widget buildSendNotification(BuildContext context) => SimpleSettingsTile(
        title: 'Set Notification',
        subtitle: '',
        // leading: IconWidgets(
        //   icon: Icons.star,
        // ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationPage(),
          ),
        ),
      );

  Widget buildLock(BuildContext context) => SimpleSettingsTile(
        title: 'Lock Screen',
        subtitle: '',
        // leading: IconWidgets(
        //   icon: Icons.bug_report,
        // ),

        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LockScreen(),
          ),
        ),
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
