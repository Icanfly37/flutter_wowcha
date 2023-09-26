import 'package:firebase_core/firebase_core.dart';

// ignore: non_constant_identifier_names
Future<void> call_db() async {
  try{
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyC4yZUvG2ROp5EvK88wBLUsyERtqc5sqGo",
      appId: "1:1080657395289:web:ece1910165622ec5b2fb48",
      messagingSenderId: "1080657395289",
      projectId: "fir-flutter-ab438",
    ));
  }
  catch (e) {
    print('Firebase initialization error: $e');
  }
}
