import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:devolopment/05_settings_file/notification_page/notification.dart';
import 'package:devolopment/05_settings_file/notification_page/widgets.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Allow Notification'),
                  content: Text('Our app would like to send you notifications'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Don\'t Allow',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                    TextButton(
                        onPressed: () => AwesomeNotifications()
                            .requestPermissionToSendNotifications()
                            .then((value) => Navigator.pop(context)),
                        child: Text(
                          'Allow',
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
                  ],
                ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              HomePageButtons(
                onPressedOne: createPlantFoodNotification,
                onPressedTwo: () async {},
                onPressedThree: () async {},
              )
            ],
          ),
        ));
  }
}
