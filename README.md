# Flutter News App

A Flutter application that displays news articles from various sources. The app follows Material Design principles and is responsive across different devices.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- A NewsAPI key (get it from [NewsAPI](https://newsapi.org))
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/mahmoudelruby/new_task.git
    cd flutter_news_app
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Configure API Key:

    Navigate to `lib/services/news_service.dart` and replace `YOUR_API_KEY` with your NewsAPI key.

    ```dart
    // filepath: /d:/news_app/lib/services/news_service.dart
    static const String _apiKey = 'YOUR_API_KEY';
    ```

## Project Structure

```plaintext
lib/
├── controllers/
│   └── news_controller.dart
├── model/
│   └── artical.dart
├── services/
│   └── news_service.dart
├── utils/
│   └── date_utils.dart
├── view/
│   ├── articles/
│   │   ├── artical_card.dart
│   │   └── artical_details_page.dart
│   ├── common/
│   │   └── web_view_page.dart
│   ├── login/
│   │   ├── login_form.dart
│   │   └── login_page.dart
│   └── home/
│       └── home_page.dart
├── main.dart

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  url_launcher: ^6.0.20
  webview_flutter: ^3.0.4
  lottie: ^1.2.1

dev_dependencies:
  flutter_test:
    sdk: flutter
    

 Running the App
To run the app, use the following command:

flutter run