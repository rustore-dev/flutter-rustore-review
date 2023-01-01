import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rustore_review/flutter_rustore_review.dart';
import 'package:flutter_rustore_review/flutter_rustore_review_platform_interface.dart';
import 'package:flutter_rustore_review/flutter_rustore_review_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterRustoreReviewPlatform
    with MockPlatformInterfaceMixin
    implements FlutterRustoreReviewPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterRustoreReviewPlatform initialPlatform = FlutterRustoreReviewPlatform.instance;

  test('$MethodChannelFlutterRustoreReview is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterRustoreReview>());
  });

  test('getPlatformVersion', () async {
    FlutterRustoreReview flutterRustoreReviewPlugin = FlutterRustoreReview();
    MockFlutterRustoreReviewPlatform fakePlatform = MockFlutterRustoreReviewPlatform();
    FlutterRustoreReviewPlatform.instance = fakePlatform;

    expect(await flutterRustoreReviewPlugin.getPlatformVersion(), '42');
  });
}
