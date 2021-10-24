//@dart=2.9
import 'package:devolopment/02_Drawer_list_items/lock_screen_page/04_lockscreen_page.dart';
import 'package:devolopment/02_Drawer_list_items/notification_page/views/alarm_page.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFFFFA738),
        child: ListView(
          padding: padding,
          children: [
            SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'Set Notification',
              icon: Icons.notifications,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Lock Screen',
              icon: Icons.lock,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            Divider(
              color: Colors.white,
            ),
            buildMenuItem(text: 'Send Feedback', icon: Icons.feedback_rounded),
            const SizedBox(height: 16),
            buildMenuItem(text: 'About Us', icon: Icons.people),
            const SizedBox(height: 16),
            buildMenuItem(text: 'Share App', icon: Icons.ios_share_outlined),
            const SizedBox(height: 16),
            buildMenuItem(text: 'Help', icon: Icons.help_outlined),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hovercolor = Colors.white;

    return ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          text,
          style: TextStyle(color: color, fontFamily: 'Sans'),
        ),
        hoverColor: hovercolor,
        onTap: onClicked);
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AlarmPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LockScreen(),
        ));
        break;
    }
  }
}
