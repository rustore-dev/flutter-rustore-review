import 'package:flutter/material.dart';
import 'package:flutter_rustore_review/flutter_rustore_review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: OutlinedButton(
          onPressed: () {
            RustoreReviewClient.request().then((value) {
              RustoreReviewClient.review().then((value) {
                print("success review");
              }, onError: (err) {
                print("on err ${err}");
              });
            });
          },
          child: Text('Review'),
        )),
      ),
    );
  }
}
