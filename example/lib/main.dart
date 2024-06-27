import 'package:flutter/material.dart';
import 'package:flutter_rustore_review/flutter_rustore_review.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class SnackbarGlobal {
  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static void show(String message) {
    key.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initReview();
  }

  void initReview() {
    RustoreReviewClient.initialize();
  }

  @override
  Widget build(BuildContext context) {
    launchRuStore() async {
      const url = "rustore://apps.rustore.ru/app/ru.rustore.reviewflutter";

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('RuStore not installed!')));
        }
      }
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Builder(
          builder: (BuildContext context) => Center(
                child: Column(children: [
                  OutlinedButton(
                    child: const Text('Request Review'),
                    onPressed: () {
                      RustoreReviewClient.request().then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'ReviewInfo requested successfully!')));
                      }, onError: (err) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'ReviewInfo request error! See log!')));
                           debugPrint("on err ${err}");
                      });
                    },
                  ),
                  OutlinedButton(
                    onPressed: () {
                      RustoreReviewClient.review().then((value) {
                        debugPrint("success review");
                      }, onError: (err) {
                        debugPrint("on err ${err}");
                      });
                    },
                    child: const Text('Review'),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        launchRuStore();
                      },
                      child: const Text('Open review in RuStore'))
                ]),
              )),
    ));
  }
}
