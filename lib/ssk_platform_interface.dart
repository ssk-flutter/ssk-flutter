import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ssk_method_channel.dart';

abstract class SskPlatform extends PlatformInterface {
  /// Constructs a SskPlatform.
  SskPlatform() : super(token: _token);

  static final Object _token = Object();

  static SskPlatform _instance = MethodChannelSsk();

  /// The default instance of [SskPlatform] to use.
  ///
  /// Defaults to [MethodChannelSsk].
  static SskPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SskPlatform] when
  /// they register themselves.
  static set instance(SskPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
