import 'package:flutter/material.dart';
import 'Modules/Home/Home_View.dart';
import 'Services/firebase.dart';

void main() {
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
      title: 'Flutter Demo',
      theme: ThemeData(
        // hintColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: FutureBuilder<void>(
        future: call_db(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const HomePage();
          } else {
            return const Center(
              child: SizedBox(
                height: 48,
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

// Supakij comment
// receive