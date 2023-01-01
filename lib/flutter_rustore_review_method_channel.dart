import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_rustore_review_platform_interface.dart';

/// An implementation of [FlutterRustoreReviewPlatform] that uses method channels.
class MethodChannelFlutterRustoreReview extends FlutterRustoreReviewPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_rustore_review');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
