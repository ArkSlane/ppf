import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCD5b5EkGZnYSNq0ZXcXP2ThcPQavi9wsU",
            authDomain: "purple-fox-0egmyy.firebaseapp.com",
            projectId: "purple-fox-0egmyy",
            storageBucket: "purple-fox-0egmyy.appspot.com",
            messagingSenderId: "473301622352",
            appId: "1:473301622352:web:f01ba992415ff6077d3b55"));
  } else {
    await Firebase.initializeApp();
  }
}
