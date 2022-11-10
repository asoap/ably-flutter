import 'package:ably_flutter/ably_flutter.dart';
import 'package:ably_flutter/src/common/src/object_hash.dart';
import 'package:meta/meta.dart';

/// BEGIN EDITED CANONICAL DOCSTRING
/// Contains an individual presence update sent to, or received from, Ably.
/// END EDITED CANONICAL DOCSTRING
@immutable
class PresenceMessage with ObjectHash {
  /// BEGIN EDITED CANONICAL DOCSTRING
  /// A unique ID assigned to each `PresenceMessage` by Ably.
  /// END EDITED CANONICAL DOCSTRING
  final String? id;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The type of [PresenceAction] the `PresenceMessage` is for.
  /// END EDITED CANONICAL DOCSTRING
  final PresenceAction? action;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The ID of the client that published the `PresenceMessage`.
  /// END EDITED CANONICAL DOCSTRING
  final String? clientId;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The ID of the connection associated with the client that published the
  /// `PresenceMessage`.
  /// END EDITED CANONICAL DOCSTRING
  final String? connectionId;

  final MessageData<dynamic>? _data;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The payload of the `PresenceMessage`.
  /// END EDITED CANONICAL DOCSTRING
  Object? get data => _data?.data;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// This will typically be empty as all presence messages received from Ably
  /// are automatically decoded client-side using this value. However, if the
  /// message encoding cannot be processed, this attribute will contain the
  /// remaining transformations not applied to the data payload.
  /// END EDITED CANONICAL DOCSTRING
  final String? encoding;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// An object that may contain metadata and/or ancillary payloads.
  /// END EDITED CANONICAL DOCSTRING
  final MessageExtras? extras;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The [DateTime] the PresenceMessage was received by Ably.
  /// END EDITED CANONICAL DOCSTRING
  final DateTime? timestamp;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Combines `clientId` and `connectionId` to ensure that multiple connected
  /// clients with an identical `clientId` are uniquely identifiable. A string
  /// function that returns the combined `clientId` and `connectionId`.
  /// END EDITED CANONICAL DOCSTRING
  String get memberKey => '$connectionId:$clientId';

  /// BEGIN EDITED DOCSTRING
  /// @nodoc
  /// Constructs a [PresenceMessage] object.
  /// END EDITED DOCSTRING
  PresenceMessage({
    this.action,
    this.clientId,
    this.connectionId,
    Object? data,
    this.encoding,
    this.extras,
    this.id,
    this.timestamp,
  }) : _data = MessageData.fromValue(data);

  @override
  bool operator ==(Object other) =>
      other is PresenceMessage &&
      other.action == action &&
      other.clientId == clientId &&
      other.connectionId == connectionId &&
      other.data == data &&
      other.encoding == encoding &&
      other.extras == extras &&
      other.id == id &&
      other.timestamp == timestamp;

  @override
  int get hashCode => objectHash([
        id,
        encoding,
        clientId,
        timestamp,
        connectionId,
        data,
        action,
        extras,
      ]);

  // https://docs.ably.com/client-lib-development-guide/features/#TP4
  //
  // TODO(tiholic): decoding and decryption is not implemented as per
  //  RSL6 and RLS6b as mentioned in TP4

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Decodes and decrypts a deserialized PresenceMessage-like [jsonObject]
  /// using the cipher in [channelOptions]. Any residual transforms
  /// that cannot be decoded or decrypted will be in the encoding property.
  /// Intended for users receiving messages from a source other than a REST or
  /// Realtime channel (for example a queue) to avoid having to parse the
  /// encoding string.
  /// END EDITED CANONICAL DOCSTRING
  PresenceMessage.fromEncoded(
    Map<String, dynamic> jsonObject, [
    RestChannelOptions? channelOptions,
  ])  : id = jsonObject['id'] as String?,
        action = PresenceAction.values.firstWhere((e) =>
            e.toString().split('.')[1] == jsonObject['action'] as String?),
        clientId = jsonObject['clientId'] as String?,
        connectionId = jsonObject['connectionId'] as String?,
        _data = MessageData.fromValue(jsonObject['data']),
        encoding = jsonObject['encoding'] as String?,
        extras = MessageExtras.fromMap(
          Map.castFrom<dynamic, dynamic, String, dynamic>(
            jsonObject['extras'] as Map,
          ),
        ),
        timestamp = jsonObject['timestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                jsonObject['timestamp'] as int,
              )
            : null;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Decodes and decrypts a [jsonArray] of deserialized PresenceMessage-like
  /// object using the cipher in [channelOptions]. Any residual
  /// transforms that cannot be decoded or decrypted will be in the encoding
  /// property. Intended for users receiving messages from a source other than a
  /// REST or Realtime channel (for example a queue) to avoid having to parse
  /// the encoding string.
  /// END EDITED CANONICAL DOCSTRING
  static List<PresenceMessage> fromEncodedArray(
    List<Map<String, dynamic>> jsonArray, [
    RestChannelOptions? channelOptions,
  ]) =>
      jsonArray
          .map((jsonObject) => PresenceMessage.fromEncoded(
                jsonObject,
                channelOptions,
              ))
          .toList();

  @override
  String toString() => 'PresenceMessage'
      ' id=$id'
      ' data=$data'
      ' action=$action'
      ' extras=$extras'
      ' encoding=$encoding'
      ' clientId=$clientId'
      ' timestamp=$timestamp'
      ' connectionId=$connectionId';
}
