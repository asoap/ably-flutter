import 'dart:io' as io show Platform;
import 'package:ably_flutter/ably_flutter.dart';
import 'package:ably_flutter/src/platform/platform_internal.dart';
import 'package:meta/meta.dart';

/// BEGIN EDITED CANONICAL DOCSTRING
/// Enables a device to be registered and deregistered from receiving push
/// notifications.
/// END EDITED CANONICAL DOCSTRING
class Push extends PlatformObject {
  /// BEGIN EDITED DOCSTRING
  /// A static object that can be used to access activation events related to
  /// push, such as device activation, deactivation and notification
  /// permissions.
  /// END EDITED DOCSTRING
  static PushActivationEvents activationEvents = PushActivationEventsInternal();

  /// BEGIN EDITED DOCSTRING
  /// A static object that can be used to access message events related to push
  /// END EDITED DOCSTRING
  static PushNotificationEvents notificationEvents =
      PushNotificationEventsInternal();

  /// BEGIN LEGACY DOCSTRING
  /// @nodoc
  /// A rest client used platform side to invoke push notification methods
  /// END LEGACY DOCSTRING
  final Rest? rest;

  /// BEGIN LEGACY DOCSTRING
  /// @nodoc
  /// A realtime client used platform side to invoke push notification methods
  /// END LEGACY DOCSTRING
  final Realtime? realtime;

  /// BEGIN LEGACY DOCSTRING
  /// @nodoc
  /// Pass an Ably realtime or rest client.
  /// END LEGACY DOCSTRING
  Push({
    this.realtime,
    this.rest,
  }) : super() {
    final ablyClientNotPresent = rest == null && realtime == null;
    final moreThanOneAblyClientPresent = rest != null && realtime != null;
    if (ablyClientNotPresent || moreThanOneAblyClientPresent) {
      throw Exception(
          'Specify one Ably client when creating ${(Push).toString()}.');
    }
  }

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Activates the device for push notifications with FCM or APNS, obtaining a
  /// unique identifier from them. Subsequently registers the device with Ably
  /// and stores the `deviceIdentityToken` in local storage.
  /// END EDITED CANONICAL DOCSTRING
  Future<void> activate() => invoke(PlatformMethod.pushActivate);

  /// BEGIN EDITED DOCSTRING
  /// Request permission from the user to show them notifications. This is
  /// required to show user notifications. Otherwise, notifications may
  /// silently get received by the application.
  ///
  /// This always returns true on Android, since you don't need permissions
  /// to show notifications to the user.
  ///
  /// You can customize the request by specifying whether the app should
  /// display [alert]s, play [sound]s, update the app's [badge], display
  /// notifications in the [carPlay] environment, whether the app should ignore
  /// the mute switch and Do Not Disturb by setting [criticalAlert], and set
  /// whether the system should display a button for in-app notification
  /// settings (iOS 12+) with [providesAppNotificationSettings].
  /// With [provisional] you can configure whether the app should send
  /// notifications on a trial basis, by delaying the permission request until
  /// the user first sees the first notification. iOS 12+. In that case a
  /// notification is first delivered quietly, and the user gets an option
  /// to deliver it more prominently. If [provisional] is true, the permission
  /// request alert will not be shown to the user, regardless of other options
  /// passed in. For more information, see
  /// [Use Provisional Authorization to Send Trial Notifications](https://developer.apple.com/documentation/usernotifications/asking_permission_to_use_notifications?language=objc)
  /// You can also choose if Siri should have an ability to automatically read
  /// out messages over AirPods (matters on iOS 13+. Deprecated in iOS 15+,
  /// because it is automatically/always granted).
  ///
  /// Asynchrously returns a [bool] indicating whether the permission was
  /// granted
  /// END EDITED DOCSTRING
  Future<bool> requestPermission({
    bool alert = true,
    bool announcement = true,
    bool badge = true,
    bool carPlay = true,
    bool criticalAlert = false,
    bool providesAppNotificationSettings = false,
    bool provisional = false,
    bool sound = true,
  }) async {
    if (io.Platform.isIOS) {
      return invokeRequest<bool>(PlatformMethod.pushRequestPermission, {
        TxPushRequestPermission.alert: alert,
        TxPushRequestPermission.announcement: announcement,
        TxPushRequestPermission.badge: badge,
        TxPushRequestPermission.carPlay: carPlay,
        TxPushRequestPermission.criticalAlert: criticalAlert,
        TxPushRequestPermission.providesAppNotificationSettings:
            providesAppNotificationSettings,
        TxPushRequestPermission.provisional: provisional,
        TxPushRequestPermission.sound: sound,
      });
    } else {
      return true;
    }
  }

  /// BEGIN EDITED DOCSTRING
  /// Gets the iOS notification settings ([UNNotificationSettings]) for
  /// the application.
  ///
  /// More details in the [Apple docs](https://developer.apple.com/documentation/usernotifications/unusernotificationcenter/1649524-getnotificationsettings)
  /// END EDITED DOCSTRING
  Future<UNNotificationSettings> getNotificationSettings() async {
    if (io.Platform.isIOS) {
      return invokeRequest<UNNotificationSettings>(
          PlatformMethod.pushGetNotificationSettings);
    } else {
      throw UnsupportedError('getNotificationSettings is only valid on iOS.');
    }
  }

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Deactivates the device from receiving push notifications with Ably and FCM
  /// or APNS.
  /// END EDITED CANONICAL DOCSTRING
  Future<void> deactivate() => invoke(PlatformMethod.pushDeactivate);

  /// BEGIN LEGACY DOCSTRING
  /// @nodoc
  /// Resets activation state of Android push device by removing
  /// device data from Android SharedPreferences. After this operation, device
  /// is recognized as a completely new push device and all device data
  /// has to be regenerated with [Push.activate] call
  ///
  /// Warning: This is an experimental method and it's use can lead to
  /// unexpected behavior in Push module
  /// END LEGACY DOCSTRING
  @experimental
  Future<void> reset() {
    if (io.Platform.isAndroid) {
      return invoke(PlatformMethod.pushReset);
    } else {
      return Future.value();
    }
  }

  @override
  Future<int?> createPlatformInstance() => (realtime != null)
      ? (realtime as Realtime).handle
      : (rest as Rest).handle;
}
