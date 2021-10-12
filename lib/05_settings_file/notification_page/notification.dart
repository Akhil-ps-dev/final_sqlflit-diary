import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:devolopment/05_settings_file/notification_page/utilities.dart';

Future<void> createPlantFoodNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: '${Emojis.money_money_bag + Emojis.plant_cactus} Buy Plant food',
        body: 'Write diary',
        notificationLayout: NotificationLayout.BigPicture
        ),
  );
}
