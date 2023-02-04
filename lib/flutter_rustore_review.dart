import 'package:flutter_rustore_review/pigeons/rustore.dart';

class RustoreReviewClient {
  static Client _api = Client();

  static Future<void> initialize() async {
    return _api.initialize();
  }

  static Future<void> request() async {
    return _api.request();
  }

  static Future<void> review() async {
    return _api.review();
  }
}
