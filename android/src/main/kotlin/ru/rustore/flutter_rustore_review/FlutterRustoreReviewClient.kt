package ru.rustore.flutter_rustore_review

import android.content.Context
import ru.rustore.flutter_rustore_review.pigeons.Rustore
import ru.rustore.sdk.core.config.SdkType
import ru.rustore.sdk.review.RuStoreReviewManager
import ru.rustore.sdk.review.RuStoreReviewManagerFactory
import ru.rustore.sdk.review.model.ReviewInfo

class FlutterRustoreReviewClient(private val context: Context): Rustore.RustoreReview {
    private var manager: RuStoreReviewManager? = null
    var info: ReviewInfo? = null

    override fun initialize(result: Rustore.Result<Void>?) {
        manager = RuStoreReviewManagerFactory.create(context, internalConfig = mapOf("type" to SdkType.FLUTTER))

        result?.success(null)
    }

    override fun request(result: Rustore.Result<Void>?) {
        manager?.requestReviewFlow()
            ?.addOnSuccessListener { info ->
                this@FlutterRustoreReviewClient.info = info
                result?.success(null)
            }
            ?.addOnFailureListener { throwable ->
                result?.error(throwable)
            }
    }

    override fun review(result: Rustore.Result<Void>?) {
        if (info == null) {
            result?.error(null)
            return
        }
        manager?.launchReviewFlow(info!!)
            ?.addOnSuccessListener {
                result?.success(null)
            }
            ?.addOnFailureListener { throwable ->
                result?.error(throwable)
            }
    }
}
