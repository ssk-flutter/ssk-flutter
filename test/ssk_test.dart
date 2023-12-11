import 'package:flutter_test/flutter_test.dart';
import 'package:ssk/ssk.dart';
import 'package:ssk/ssk_platform_interface.dart';
import 'package:ssk/ssk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSskPlatform
    with MockPlatformInterfaceMixin
    implements SskPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SskPlatform initialPlatform = SskPlatform.instance;

  test('$MethodChannelSsk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSsk>());
  });

  test('getPlatformVersion', () async {
    Ssk sskPlugin = Ssk();
    MockSskPlatform fakePlatform = MockSskPlatform();
    SskPlatform.instance = fakePlatform;

    expect(await sskPlugin.getPlatformVersion(), '42');
  });
}
