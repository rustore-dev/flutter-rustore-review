import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rustore_review/flutter_rustore_review_method_channel.dart';

void main() {
  MethodChannelFlutterRustoreReview platform = MethodChannelFlutterRustoreReview();
  const MethodChannel channel = MethodChannel('flutter_rustore_review');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
