import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/auth/auth_gate.dart';
import 'package:food_delivery_app/firebase/firebase_options.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:food_delivery_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(MultiProvider(
    providers: [
      //theme
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      //restaurant
      ChangeNotifierProvider(create: (context) => Restaurant()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
        theme: Provider.of<ThemeProvider>(context).themeData);
  }
}
