import 'package:pigeon/pigeon.dart';

class ReviewInfo {
  late String appDescription;
}

@HostApi()
abstract class RustoreReview {
  @async
  void initialize();

  @async
  void request();

  @async
  void review();
}
