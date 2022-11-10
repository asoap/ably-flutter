import 'package:ably_flutter/ably_flutter.dart';
import 'package:meta/meta.dart';

/// BEGIN EDITED CANONICAL DOCSTRING
/// Defines the properties of an Ably Token.
/// END EDITED CANONICAL DOCSTRING
@immutable
class TokenParams {
  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The capabilities associated with this Ably Token. The capabilities value
  /// is a JSON-encoded representation of the resource paths and associated
  /// operations. Read more about capabilities in the
  /// [capabilities docs](https://ably.com/docs/core-features/authentication/#capabilities-explained).
  /// END EDITED CANONICAL DOCSTRING
  final String? capability;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// A client ID, used for identifying this client when publishing messages or
  /// for presence purposes. The `clientId` can be any non-empty string, except
  /// it cannot contain a `*`. This option is primarily intended to be used in
  /// situations where the library is instantiated with a key. Note that a
  /// `clientId` may also be implicit in a token used to instantiate the
  /// library. An error is raised if a `clientId` specified here conflicts with
  /// the clientId implicit in the token. Find out more about
  /// [identified clients](https://ably.com/docs/core-features/authentication#identified-clients).
  /// END EDITED CANONICAL DOCSTRING
  final String? clientId;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// A cryptographically secure random string of at least 16 characters, used
  /// to ensure the [TokenRequest] cannot be reused.
  /// END EDITED CANONICAL DOCSTRING
  final String? nonce;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// The [DateTime] of this request. Timestamps, in conjunction with the
  /// `nonce`,  are used to prevent requests from being replayed. `timestamp`
  /// is a "one-time" value, and is valid in a request, but is not validly a
  /// member of any default token params such as
  /// `ClientOptions.defaultTokenParams`.
  /// END EDITED CANONICAL DOCSTRING
  final DateTime? timestamp;

  /// BEGIN EDITED CANONICAL DOCSTRING
  /// Requested time to live for the token in milliseconds.
  /// END EDITED CANONICAL DOCSTRING
  final int? ttl;

  /// BEGIN LEGACY DOCSTRING
  /// @nodoc
  /// instantiates a [TokenParams] with provided values
  /// END LEGACY DOCSTRING
  const TokenParams({
    this.capability,
    this.clientId,
    this.nonce,
    this.timestamp,
    this.ttl,
  });

  /// BEGIN LEGACY DOCSTRING
  /// @nodoc
  /// converts to a map of objects
  /// END LEGACY DOCSTRING
  Map<String, dynamic> toMap() {
    final jsonMap = <String, dynamic>{};
    if (capability != null) jsonMap['capability'] = capability;
    if (clientId != null) jsonMap['clientId'] = clientId;
    if (nonce != null) jsonMap['nonce'] = nonce;
    if (timestamp != null) {
      jsonMap['timestamp'] = timestamp?.millisecondsSinceEpoch.toString();
    }
    if (ttl != null) jsonMap['ttl'] = ttl.toString();
    return jsonMap;
  }
}
