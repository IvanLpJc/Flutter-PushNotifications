import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    // print('_backgroundHandler ${message.messageId}');

    _messageStream.add(message.data['Producto'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print('_onMessageHandler ${message.messageId}');

    _messageStream.add(message.data['Producto'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print('_onMessageOpenApp handler ${message.messageId}');

    _messageStream.add(message.data['Producto'] ?? 'No data');
  }

  static Future initializeApp() async {
    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    // Handlers: Pasamos las referencias a nuestros métodos
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    // Local notifications
  }

  static closeStreams() {
    _messageStream.close();
  }
}
