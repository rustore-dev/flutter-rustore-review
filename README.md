<div align="left" style="margin:0 0 14px 0;">

  <span style="display:inline-block;
               padding:.28rem .6rem;
               border:1px solid rgba(0,0,0,.18);
               border-radius:10px 0 0 10px;
               font-weight:400;
               font-size:12px;
               letter-spacing:.06em;
               color:#111827;
               background:linear-gradient(180deg,#ffffff,#f3f4f6);
               box-shadow:0 1px 0 rgba(0,0,0,.06);">
    [RU][ru]
  </span><span style="display:inline-block;
               margin-left:-1px;
               padding:.28rem .6rem;
               border:1px solid rgba(0,0,0,.14);
               border-radius:0 10px 10px 0;
               font-weight:400;
               font-size:12px;
               letter-spacing:.06em;
               background:linear-gradient(180deg,#e9edf2,#ffffff);
               box-shadow:inset 0 2px 6px rgba(0,0,0,.10);">
    EN
  </span>

</div>
<!-- ────────────────────────────────────────────────────────────────── -->

# flutter_rustore_review

## [Documentation RuStore](https://help.rustore.ru/rustore/for_developers/developer-documentation/SDK-reviews-ratings/flutter)

- [flutter\_rustore\_review](#flutter_rustore_review)
  - [Documentation RuStore](#documentation-rustore)
    - [Conditions for correct SDK operation](#conditions-for-correct-sdk-operation)
    - [When to request a rating and review](#when-to-request-a-rating-and-review)
    - [Design recommendations](#design-recommendations)
    - [Preparing required parameters](#preparing-required-parameters)
    - [Setting up the sample app](#setting-up-the-sample-app)
  - [Integration into the project](#integration-into-the-project)
  - [Requesting a rating](#requesting-a-rating)

### Conditions for correct SDK operation

To ensure proper SDK functionality for ratings and reviews, the following conditions must be met:

- Android OS version 7.0 or higher.
- The RuStore application is installed on the user's device.
- The RuStoreApp version on the user's device is up-to-date.
- The user is logged into the RuStore app.

### When to request a rating and review

To determine when to ask a user for an app rating and review, follow these recommendations:

- Start the flow after the user has sufficiently used your app.
- Do not run the flow too frequently — this will degrade the user experience of your app and limit the use of the rating SDK.
- Avoid using calls to action, such as a "Rate App" button — the user may have already reached the flow execution limit.
- Your app should not ask any questions before or during the flow, including opinion-based questions (e.g., "Do you like the app?") or predictive questions (e.g., "Would you give this app 5 stars?").

### Design recommendations

To decide how to integrate the flow, follow these recommendations:

- Display the flow as-is, without any interference or changes to the current design, including size, opacity, shape, and other properties.
- Do not add anything over or around the flow.
- The flow must open above all layers. After starting the flow, do not close it manually. The flow will terminate automatically after explicit user action.

### Preparing required parameters

To run the example, you need the following parameters:

1. `applicationId` - from the app you published in the RuStore console, located in your project’s build.gradle file

```
  android {
     defaultConfig {
     applicationId = "ru.rustore.sdk.reviewexmaple"
     }
  }
```

2. `release.keystore` - the signature with which the app published in the RuStore console was signed.

### Setting up the sample app

1. Replace `applicationId` in the example/android/app/build.gradle file with the application ID of the APK you published in the RuStore console:

```
android {
  defaultConfig {
    applicationId = "ru.rustore.sdk.reviewexmaple" // Often .debug is appended in buildTypes
  }
}
```

2. Replace the signature with your app's signature. Configure the `key_alias`, `key_password`, and `store_password` parameters:

```
android{
  signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
}
```

## Integration into the project

To add the package to your project, run the command:

```
flutter pub add flutter_rustore_review
```

This command will add a line to the pubspec.yaml file:

```
dependencies:
    flutter_rustore_review: ^10.5.2
```

## Requesting a rating

To display a window with a rating and a review form, initialize the plugin:

```
RustoreReviewClient.initialize();
```

After initialization, you can make a request and show the form:

```
RustoreReviewClient.request().then((value) {
  RustoreReviewClient.review().then((value) {
    print("success review");
  }, onError: (err) {
    print("on err ${err}");
  });
});
```

[ru]: README.ru.md
[en]: README.md
