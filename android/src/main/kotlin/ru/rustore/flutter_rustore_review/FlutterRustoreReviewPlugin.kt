package ru.rustore.flutter_rustore_review

import android.content.Context

import io.flutter.embedding.engine.plugins.FlutterPlugin
import ru.rustore.flutter_rustore_review.pigeons.Rustore

/** FlutterRustoreReviewPlugin */
class FlutterRustoreReviewPlugin: FlutterPlugin {
  private lateinit var context: Context
  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    context = binding.applicationContext

    val client = FlutterRustoreReviewClient(context)
    Rustore.RustoreReview.setUp(binding.binaryMessenger, client)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) = Unit
}
