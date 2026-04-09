import 'package:flutter_test/flutter_test.dart';
import 'package:plugintest/plugintest.dart';
import 'package:plugintest/plugintest_platform_interface.dart';
import 'package:plugintest/plugintest_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlugintestPlatform
    with MockPlatformInterfaceMixin
    implements PlugintestPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PlugintestPlatform initialPlatform = PlugintestPlatform.instance;

  test('$MethodChannelPlugintest is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlugintest>());
  });

  test('getPlatformVersion', () async {
    Plugintest plugintestPlugin = Plugintest();
    MockPlugintestPlatform fakePlatform = MockPlugintestPlatform();
    PlugintestPlatform.instance = fakePlatform;

    expect(await plugintestPlugin.getPlatformVersion(), '42');
  });
}
