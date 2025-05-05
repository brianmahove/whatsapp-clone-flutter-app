import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/ui/home_screen.dart';
import 'package:whatsapp/theme/theme_provider.dart';
import 'package:whatsapp/theme/app_themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'WhatsApp',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      home: const WhatsAppHomeScreen(),
    );
  }
}
