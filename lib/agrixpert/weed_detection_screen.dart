import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const WeedDetectorApp());
}

class WeedDetectorApp extends StatelessWidget {
  const WeedDetectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weed Detector',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.shade700,
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
      home: const WeedDetectionScreen(),
    );
  }
}

class WeedDetectionScreen extends StatelessWidget {
  const WeedDetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weed Detection')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Weed Detector!',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'This app will soon bring you advanced weed detection capabilities, helping you protect your crops and the environment.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, 'Why Weed Detection Matters'),
            const SizedBox(height: 8.0),
            const Text(
              'Weeds are a major threat to healthy crop growth. They quickly spread, compete for essential resources, and can introduce diseases, ultimately leading to lower yields.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Traditional methods like blanket herbicide spraying can be harmful to the ecosystem. Our goal is to provide a smarter, more targeted solution.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(
              context,
              'The Future of Weed Control is Here (Soon!)',
            ),
            const SizedBox(height: 8.0),
            const Text(
              'This app is currently under development. In future versions, you will be able to:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- **Identify Weeds with Your Camera:** Simply point your device\'s camera at a plant, and our intelligent system will identify if it\'s a weed.',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- **Pinpoint Weed Locations:** The app will help you map the exact locations of weeds in your fields, allowing for precise intervention.',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- **Reduce Herbicide Use:** By knowing exactly where weeds are, you can apply treatments only where necessary, minimizing environmental impact and saving resources.',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, 'Stay Tuned for Updates!'),
            const SizedBox(height: 8.0),
            const Text(
              'Our team is working diligently to train the underlying models and build the features that will make weed detection smart and easy for every farmer.',
              style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Thank you for your interest in Weed Detector. We are excited to bring this powerful tool to you in a future release. Keep an eye out for announcements!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.green.shade700,
      ),
    );
  }
}
