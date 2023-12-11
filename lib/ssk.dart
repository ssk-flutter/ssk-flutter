
import 'ssk_platform_interface.dart';

class Ssk {
  Future<String?> getPlatformVersion() {
    return SskPlatform.instance.getPlatformVersion();
  }
}
