import 'package:contactbooktotalx/viewmodel/auth_viewmodel.dart';
import 'package:contactbooktotalx/view/mobile_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(
    ChangeNotifierProvider(
      create: (context) => MobileAuthViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Book TotalX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MobileAuth(),
    );
  }
}
