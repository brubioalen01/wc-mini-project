import 'package:flutter/material.dart';
import 'package:wcminiproj/features/messages/presentation/pages/messages.dart';
import 'package:wcminiproj/core/dependency_injection/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.deepPurpleAccent),
      ),
      home: const Messages(),
    );
  }
}
