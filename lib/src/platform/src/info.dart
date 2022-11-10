import 'dart:io' as io show Platform;

import 'package:ably_flutter/ably_flutter.dart';
import 'package:ably_flutter/src/platform/platform_internal.dart';

/// BEGIN EDITED DOCSTRING
/// Get android/iOS platform version
/// END EDITED DOCSTRING
Future<String> platformVersion() async => Platform()
    .invokePlatformMethodNonNull<String>(PlatformMethod.getPlatformVersion);

/// BEGIN EDITED DOCSTRING
/// Get ably library version
/// END EDITED DOCSTRING
Future<String> version() async =>
    Platform().invokePlatformMethodNonNull<String>(PlatformMethod.getVersion);

/// BEGIN EDITED DOCSTRING
/// Get version of Dart runtime
/// END EDITED DOCSTRING
String dartVersion() => readSemverFromPlatformVersion(io.Platform.version);

/// BEGIN EDITED DOCSTRING
/// Extracts semver value from platform version
/// value is split by space and first element is selected as semver value
/// END EDITED DOCSTRING
String readSemverFromPlatformVersion(String platformVersion) =>
    platformVersion.split(' ').first;
