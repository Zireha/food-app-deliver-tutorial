import 'package:flutter/material.dart';
import 'package:food_delivery_app/auth/login_or_register.dart';
import 'package:food_delivery_app/model/restaurant.dart';
import 'package:food_delivery_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      //theme
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      //restaurant
      ChangeNotifierProvider(create: (context) => Restaurant()),
    ],
    child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginOrRegister(),
        theme: Provider.of<ThemeProvider>(context).themeData);
  }
}
