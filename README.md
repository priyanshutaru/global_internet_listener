# 🌐 global_internet_listener

`global_internet_listener` is a lightweight and easy-to-use Flutter package that enables **global internet connectivity monitoring** throughout your app.  
With just a simple wrapper in your `main.dart`, it observes connectivity changes and allows you to handle them elegantly.

---
## 📽️ Demo

<div align="center">
  <img src="https://github.com/user-attachments/assets/71739cd2-784b-42f4-aad9-c8512adc4ea1" 
       alt="Demo GIF" 
       width="350" 
       style="border-radius: 12px; border: 1px solid #ccc;" />
</div>

---

## ✅ Features

- 🔌 Detects internet status (online/offline) globally.
- 🚀 Automatically listens across the entire app.
- 🧩 Plug-and-play usage inside `MaterialApp.builder`.
- 🎯 Useful for showing alerts, snackbars, or banners.

- 🛠️ Minimal configuration — works out of the box.

---

## 🚀 Getting Started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  global_internet_listener: ^1.0.0
```

---

## 📦 Usage

Wrap your `MaterialApp` with the `GlobalInternetListenerScope`:

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Connectivity Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // ✅ Enable global internet checker
      builder: (context, child) {
        return GlobalInternetListener(
          child: child ?? const SizedBox.shrink(),
        );
      },

      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

```

---

## 📌 Additional Info

- Package will automatically listen to connectivity changes using the `connectivity_plus` plugin.
- You can customize the `onOffline` and `onOnline` callbacks based on your app needs.

---

## 🙌 Contribution

Feel free to open issues or contribute via PRs.


