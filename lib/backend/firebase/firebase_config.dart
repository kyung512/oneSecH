import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCFTUkYM-j_zOYZIfGCTfxaJ_lL-1kK1vk",
            authDomain: "onesecapp-ea058.firebaseapp.com",
            projectId: "onesecapp-ea058",
            storageBucket: "onesecapp-ea058.appspot.com",
            messagingSenderId: "815644187338",
            appId: "1:815644187338:web:ff5dc23bf460fd741f7233",
            measurementId: "G-VH45R3MG2T"));
  } else {
    await Firebase.initializeApp();
  }
}
