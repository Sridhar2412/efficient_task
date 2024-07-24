import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master/presentation/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCpe1Zj9aL_AAn6p1Q169WlFQyKsrd3YZk',
          appId: 'com.school.app',
          messagingSenderId: '',
          projectId: 'school-app-d27a7'));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    const ProviderScope(child: HomePage()),
  );
}
