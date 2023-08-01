import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:opt_verification/firebase_options.dart';

import 'welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter OTP Verification',
      debugShowCheckedModeBanner: true,
      home: Welcome(),
    );
  }
}
