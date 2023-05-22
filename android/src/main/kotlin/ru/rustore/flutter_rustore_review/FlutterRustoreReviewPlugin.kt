package ru.rustore.flutter_rustore_review

import android.app.Application
import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import ru.rustore.flutter_rustore_review.pigeons.Rustore
import ru.rustore.flutter_rustore_review.utils.Log

/** FlutterRustoreReviewPlugin */
class FlutterRustoreReviewPlugin: FlutterPlugin {
  private lateinit var context: Context
  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    context = binding.applicationContext

    val client = FlutterRustoreReviewClient(context)
    Rustore.RustoreReview.setup(binding.binaryMessenger, client)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

  }
}
