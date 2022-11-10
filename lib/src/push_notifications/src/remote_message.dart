import 'package:ably_flutter/ably_flutter.dart';
import 'package:ably_flutter/src/platform/platform_internal.dart';

/// BEGIN EDITED DOCSTRING
/// Represents FCM Message on Android and APNS message on iOS
/// Both [data] and [notification] are related to corresponding fields in
/// Android FCM 'RemoteMessage' and iOS 'UNNotificationContent'
///
/// See https://firebase.google.com/docs/reference/android/com/google/firebase/messaging/RemoteMessage
/// See https://developer.apple.com/documentation/usernotifications/unnotificationcontent
/// END EDITED DOCSTRING
class RemoteMessage {
  /// BEGIN EDITED DOCSTRING
  /// Data part of notification, from custom payload.
  ///
  /// Comes from 'RemoteMessage.data' on Android and
  /// 'UNNotificationContent.userInfo' on iOS
  /// END EDITED DOCSTRING
  Map<String, dynamic> data;

  /// BEGIN EDITED DOCSTRING
  /// Notification part of push message
  /// END EDITED DOCSTRING
  Notification? notification;

  /// @nodoc
  /// Initializes an instance with [data] set to empty map
  RemoteMessage({
    Map<String, dynamic>? data,
    this.notification,
  }) : data = data ??= {};

  /// @nodoc
  /// create instance from a map
  factory RemoteMessage.fromMap(Map<String, dynamic> map) => RemoteMessage(
        data: (map[TxRemoteMessage.data] == null)
            ? <String, dynamic>{}
            : Map<String, dynamic>.from(
                map[TxRemoteMessage.data] as Map<dynamic, dynamic>,
              ),
        notification: (map[TxRemoteMessage.notification] == null)
            ? null
            : Notification.fromMap(
                Map<String, dynamic>.from(
                    map[TxRemoteMessage.notification] as Map<dynamic, dynamic>),
              ),
      );
}
