import 'package:barcelona/views/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  static final ValueNotifier<ThemeMode> notifier =
      ValueNotifier(ThemeMode.dark);
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (_, value, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              colorScheme: const ColorScheme.light(
                  primary: Color.fromARGB(255, 153, 0, 71))),
          darkTheme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(255, 2, 21, 75),
              colorScheme: const ColorScheme.dark(
                  primary: Color.fromARGB(255, 1, 118, 211))),
          themeMode: value,
          home: const LoginPage(),
        );
      },
    );
  }
}
