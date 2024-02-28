// Import necessary packages and screens
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_status_5_days/pages/screens.dart';
import 'package:weather_status_5_days/pages/weather_screen.dart';

// Entry point of the application
void main() {
  // Run the Flutter application
  runApp(const MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Build method to define the structure of the application
  @override
  Widget build(BuildContext context) {
    
    // Set preferred device orientations to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Set system UI overlay style (status bar color)
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white
    ));
    
    // Return the MaterialApp widget, configuring the theme, initial route, and routes
    return MaterialApp(
      title: 'Weather Status',
      theme: ThemeData(
        // Customize the color scheme for the application
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue[900]!),
        
        // Customize the AppBar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black12,
        ),
        
        // Enable Material 3 theming
        useMaterial3: true,
      ),
      // Disable the debug banner in the top-right corner
      debugShowCheckedModeBanner: false,
      
      // Set the initial route and define named routes with corresponding widgets
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName:        (context) => const HomeScreen(),
        WeatherScreen.routerName:     (context) => const WeatherScreen(), 
      },
    );
  }
}