package ru.rustore.flutter_rustore_review.utils

import android.util.Log as l

object Log {
    fun i(msg: String) {
        l.i("FlutterRustoreReview", msg)
    }

    fun d(msg: String) {
        l.d("FlutterRustoreReview", msg)
    }
}