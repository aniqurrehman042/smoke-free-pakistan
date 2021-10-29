import 'package:firebase_core/firebase_core.dart';

class FirebaseController {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Future<FirebaseApp> get initialization => _initialization;
}