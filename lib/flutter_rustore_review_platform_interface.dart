import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_rustore_review_method_channel.dart';

abstract class FlutterRustoreReviewPlatform extends PlatformInterface {
  /// Constructs a FlutterRustoreReviewPlatform.
  FlutterRustoreReviewPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterRustoreReviewPlatform _instance = MethodChannelFlutterRustoreReview();

  /// The default instance of [FlutterRustoreReviewPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterRustoreReview].
  static FlutterRustoreReviewPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterRustoreReviewPlatform] when
  /// they register themselves.
  static set instance(FlutterRustoreReviewPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
