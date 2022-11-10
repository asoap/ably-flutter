import 'package:ably_flutter/ably_flutter.dart';

/// BEGIN EDITED CANONICAL DOCSTRING
/// Params to configure encryption for a channel
///
/// Pass this as the cipher constructor argument of [RestChannelOptions.new] or
/// [RealtimeChannelOptions.new]. Do not construct [CipherParams] yourself, as
/// it internally refers to an instance of [CipherParams] on the platform side
/// (Android / iOS).
///
/// This class does not expose algorithm, keyLength or mode because these fields
/// are private in ably-java's Crypto.CipherParams.
///
/// https://docs.ably.com/client-lib-development-guide/features/#TZ1
/// END EDITED CANONICAL DOCSTRING
abstract class CipherParams {}
