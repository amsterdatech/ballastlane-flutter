import 'package:ballastlane_flutter/providers/auth_provider.dart';
import 'package:ballastlane_flutter/providers/shows_provider.dart';
import 'package:ballastlane_flutter/screens/home_screen.dart';
import 'package:ballastlane_flutter/screens/login_screen.dart';
import 'package:ballastlane_flutter/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(
            create: (create) => ShowsProvider(client: http.Client()))
      ],
      child: MaterialApp(
        title: 'BallastLane Tv App',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            color: Colors.teal, //<-- SEE HERE
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        routes: {
          "/home": (context) => HomeScreen(),
          "/login": (context) => LoginScreen(),
        },
      ),
    );
  }
}
