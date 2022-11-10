import 'package:ably_flutter/ably_flutter.dart';
import 'package:meta/meta.dart';

/// BEGIN EDITED CANONICAL DOCSTRING
/// Contains the properties of a device registered for push notifications.
/// END EDITED CANONICAL DOCSTRING
@immutable
class DeviceDetails {
  /// BEGIN EDITED CANONICAL DOCSTRING
  /// A unique ID generated by the device.
  /// END EDITED CANONICAL DOCSTRING
  final String? id;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The client ID the device is connected to Ably with.
  /// END EDITED CANONICAL DOCSTRING
  final String? clientId;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The [DevicePlatform] associated with the device. Describes the platform
  /// the device uses, such as `android` or `ios`.
  /// END EDITED CANONICAL DOCSTRING
  final DevicePlatform platform;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The [FormFactor] object associated with the device. Describes the type of
  /// the device, such as `phone` or `tablet`.
  /// END EDITED CANONICAL DOCSTRING
  final FormFactor formFactor;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// A [Map] object of key-value pairs that contains metadata for the device.
  /// END EDITED CANONICAL DOCSTRING
  final Map<String, String> metadata;

  /// BEGIN CANONICAL DOCSTRING
  /// The [DevicePushDetails] object associated with the device. Describes the
  /// details of the push registration of the device.
  /// END CANONICAL DOCSTRING
  final DevicePushDetails push;

  /// @nodoc
  /// Initializes an instance without any defaults
  const DeviceDetails({
    required this.formFactor,
    required this.metadata,
    required this.platform,
    required this.push,
    this.clientId,
    this.id,
  });
}
