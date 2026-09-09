<!-- ── Language switch (RU active) ──────────────────────────────────── -->
<div align="left" style="margin:0 0 14px 0;">

  <span style="display:inline-block;
               padding:.28rem .6rem;
               border:1px solid rgba(0,0,0,.18);
               border-radius:10px 0 0 10px;
               font-weight:400;
               font-size:12px;
               letter-spacing:.06em;
               color:#111827;
               background:linear-gradient(180deg,#e9edf2,#ffffff);
               box-shadow:inset 0 2px 6px rgba(0,0,0,.10);">
    RU
  </span><span style="display:inline-block;
               margin-left:-1px;
               padding:.28rem .6rem;
               border:1px solid rgba(0,0,0,.14);
               border-radius:0 10px 10px 0;
               font-weight:400;
               font-size:12px;
               letter-spacing:.06em;
               background:linear-gradient(180deg,#ffffff,#f3f4f6);
               box-shadow:0 1px 0 rgba(0,0,0,.06);">
    [EN][en]
  </span>

</div>
<!-- ────────────────────────────────────────────────────────────────── -->

# flutter_rustore_review

## [Документация RuStore](https://help.rustore.ru/rustore/for_developers/developer-documentation/SDK-reviews-ratings/flutter)

- [flutter\_rustore\_review](#flutter_rustore_review)
  - [Документация RuStore](#документация-rustore)
    - [Условия корректной работы SDK](#условия-корректной-работы-sdk)
    - [Когда запрашивать оценку и отзыв](#когда-запрашивать-оценку-и-отзыв)
    - [Рекомендации к дизайну](#рекомендации-к-дизайну)
    - [Подготовка требуемых параметров](#подготовка-требуемых-параметров)
    - [Настройка примера приложения](#настройка-примера-приложения)
  - [Подключение в проект](#подключение-в-проект)
  - [Запрос оценки](#запрос-оценки)

### Условия корректной работы SDK

Для работы SDK оценок и отзывов необходимо соблюдение следующих условий:

- ОС Android версии 7.0 или выше.
- На устройстве пользователя установлено приложение RuStore.
- Версия RuStoreApp на устройстве пользователя актуальная.
- Пользователь  авторизован в приложении RuStore.

### Когда запрашивать оценку и отзыв

Чтобы решить в какой момент запросить оценку и отзыв о приложении у пользователя, следуйте рекомендациям:

- Запускайте флоу после того, как пользователь достаточно использовал ваше приложение.
- Не запускайте флоу слишком часто — это ухудшит опыт пользователя вашего приложения и ограничит использование SDK оценок.
- Не используйте призывы к действию, например, кнопку «Оценить приложение» — пользователь уже мог исчерпать лимит запуска флоу.
- Ваше приложение не должно задавать какие-либо вопросы пользователю перед запуском или во время флоу, в том числе вопросы об их мнении (например, «Вам нравится приложение?») или прогнозирующие вопросы (например, «Вы бы поставили этому приложению 5 звёзд?»).

### Рекомендации к дизайну

Чтобы решить, как интегрировать флоу, следуйте рекомендациям:

- Отображайте флоу как есть, без какого-либо вмешательства или изменения текущего дизайна, включая размер, непрозрачность, форму и другие свойства.
- Ничего не добавляйте поверх или по краям флоу.
- Флоу должен открываться поверх всех слоёв. После запуска флоу не закрывайте его. Флоу завершится самостоятельно после явного действия пользователя.

### Подготовка требуемых параметров

Для запуска примера, вам нужны следующие параметры:

1. `applicationId` - - из приложения, которое вы публиковали в консоль RuStore, находится в файле build.gradle вашего проекта

```
  android {
     defaultConfig {
     applicationId = "ru.rustore.sdk.reviewexmaple"
     }
  }
```

2. `release.keystore` - подпись, которой было подписано приложение, опубликованное в консоль RuStore.

### Настройка примера приложения

1. Замените `applicationId` в файле example/android/app/build.gradle, на applicationId apk-файла, который вы публиковали в консоль RuStore:

```
android {
  defaultConfig {
    applicationId = "ru.rustore.sdk.reviewexmaple" // Зачастую в buildTypes приписывается .debug
  }
}
```

2 . Замените подпись на подпись вашего приложения. Настройте параметры `key_alias`, `key_password`, `store_password`

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

## Подключение в проект

Для подключения пакета к проекту нужно выполнить команду

```
flutter pub add flutter_rustore_review
```

Эта команда добавит строчку в файл pubspec.yaml

```
dependencies:
    flutter_rustore_review: ^10.5.2
```

## Запрос оценки

Для отображения окна с оценкой и формой для отзыва, необходимо выполнить инициализацию плагина

```
RustoreReviewClient.initialize();
```

После инициализации можно делать запрос и показ формы

```
RustoreReviewClient.request().then((value) {
  RustoreReviewClient.review().then((value) {
    print("success review");
  }, onError: (err) {
    print("on err ${err}");
  });
});
```

[en]: README.md
