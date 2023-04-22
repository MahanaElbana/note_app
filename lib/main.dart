import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import 'app/app.dart';
import 'data/shared_preferences/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCaIfSzGR9F3AWt0qnCdIyRbuvLMn4ex-I",
      projectId: "noteapp-f4afc",
      messagingSenderId: "89427593115",
      appId: "1:89427593115:web:f95e879413d9c19da6833e",
    ),
  );
  await LocalStorageSharedPrefs().initialization(); 
  
  runApp(NoteApp());
}
