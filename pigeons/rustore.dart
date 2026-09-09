import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
    dartOut: 'lib/pigeons/rustore.dart',
    dartOptions: DartOptions(),
    javaOut:
        'android/src/main/kotlin/ru/rustore/flutter_rustore_review/pigeons/Rustore.java',
    javaOptions: JavaOptions(
        package: 'ru.rustore.flutter_rustore_review.pigeons')))

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
