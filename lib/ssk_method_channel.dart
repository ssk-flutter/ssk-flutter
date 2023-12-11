import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ssk_platform_interface.dart';

/// An implementation of [SskPlatform] that uses method channels.
class MethodChannelSsk extends SskPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ssk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
