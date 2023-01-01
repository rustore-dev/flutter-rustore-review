
import 'flutter_rustore_review_platform_interface.dart';

class FlutterRustoreReview {
  Future<String?> getPlatformVersion() {
    return FlutterRustoreReviewPlatform.instance.getPlatformVersion();
  }
}
