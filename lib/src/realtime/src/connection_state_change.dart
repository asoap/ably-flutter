import 'package:ably_flutter/ably_flutter.dart';
import 'package:meta/meta.dart';

/// BEGIN LEGACY DOCSTRING
/// Whenever the connection state changes,
/// a ConnectionStateChange object is emitted on the [Connection] object
///
/// https://docs.ably.com/client-lib-development-guide/features/#TA1
/// END LEGACY DOCSTRING

/// BEGIN CANONICAL DOCSTRING
/// Contains [ConnectionState]{@link} change information emitted by the
/// [Connection]{@link} object.
/// END CANONICAL DOCSTRING
@immutable
class ConnectionStateChange {
  /// BEGIN LEGACY DOCSTRING
  /// https://docs.ably.com/client-lib-development-guide/features/#TA2
  /// END LEGACY DOCSTRING

  /// BEGIN CANONICAL DOCSTRING
  /// The event that triggered this [ConnectionState]{@link ConnectionState}
  /// change.
  /// END CANONICAL DOCSTRING
  final ConnectionEvent event;

  /// BEGIN LEGACY DOCSTRING
  /// current state of the channel
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#TA2
  /// END LEGACY DOCSTRING

  /// BEGIN CANONICAL DOCSTRING
  /// The new [ConnectionState]{@link ConnectionState}.
  /// END CANONICAL DOCSTRING
  final ConnectionState current;

  /// BEGIN LEGACY DOCSTRING
  /// previous state of the channel
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#TA2
  /// END LEGACY DOCSTRING

  /// BEGIN CANONICAL DOCSTRING
  /// The previous [ConnectionState]{@link ConnectionState}. For the
  /// [UPDATE]{@link ConnectionEvent#UPDATE} event, this is equal to the current
  /// [ConnectionState]{@link ConnectionState}.
  /// END CANONICAL DOCSTRING
  final ConnectionState previous;

  /// BEGIN LEGACY DOCSTRING
  /// reason for failure, in case of a failed state
  ///
  /// If the channel state change includes error information,
  /// then the reason attribute will contain an ErrorInfo
  /// object describing the reason for the error
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#TA3
  /// END LEGACY DOCSTRING

  /// BEGIN CANONICAL DOCSTRING
  /// An [ErrorInfo]{@link ErrorInfo} object containing any information relating
  /// to the transition.
  /// END CANONICAL DOCSTRING
  final ErrorInfo? reason;

  /// BEGIN LEGACY DOCSTRING
  /// when the client is not connected, a connection attempt will be made
  /// automatically by the library after the number of milliseconds
  /// specified by [retryIn]
  ///
  /// https://docs.ably.com/client-lib-development-guide/features/#TA2
  /// END LEGACY DOCSTRING

  /// BEGIN CANONICAL DOCSTRING
  /// Duration in milliseconds, after which the client retries a connection
  /// where applicable.
  /// END CANONICAL DOCSTRING
  final int? retryIn;

  /// BEGIN LEGACY DOCSTRING
  /// initializes without any defaults
  /// END LEGACY DOCSTRING
  const ConnectionStateChange({
    required this.current,
    required this.event,
    required this.previous,
    this.reason,
    this.retryIn,
  });
}
