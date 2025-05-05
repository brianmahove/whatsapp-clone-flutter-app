import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/agrixpert/privacypoli.dart'; // Import the flutter_svg package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iKnowFarm Contacts',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0),
          titleSmall: TextStyle(fontSize: 14.0, color: Colors.grey),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: Colors.green, // Match the AppBar color
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Consistent button color
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        dividerTheme: const DividerThemeData(
          space: 20,
          thickness: 1,
          color: Colors.grey,
        ),
      ),
      home: const PrivacyPolicyPage(),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to make phone calls
  Future<void> _launchPhone(String phoneNumber) async {
    final Uri uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // Function to launch WhatsApp
  Future<void> _launchWhatsApp(String phoneNumber) async {
    // Add '+' if it is not included
    String formattedPhoneNumber =
        phoneNumber.startsWith('+') ? phoneNumber : '+$phoneNumber';
    final Uri uri = Uri.parse('https://wa.me/$formattedPhoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch WhatsApp on $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About iKnowFarm'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // App Logo
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Image.asset(
                    'assets/iknowfarm_logo.png', // Replace with your actual logo path
                    width: 100, // Adjust size as needed
                    height: 100,
                  ),
                ),
              ),
              // Description Text
              const Text(
                "AgriXpert is an innovative, AI-powered mobile application designed to empower farmers of all sizes, from small-scale to large-scale operations, with cutting-edge tools for enhanced productivity and sustainable farming practices. Our mission is to provide farmers with real-time data, climate insights, and intelligent decision-making tools to help them optimize yields and adapt to changing environmental conditions. With AgriXpert, we are transforming the way farming is done by integrating smart technologies such as weather forecasting, disease detection, crop and livestock management, and much more. Our goal is to make farming easier, more efficient, and more profitable for everyone, whether you're growing crops, managing livestock, or both.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Contacts Title
              const Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Phone Numbers
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.green),
                          const SizedBox(width: 10),
                          const Text(
                            'Tel 1: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () => _launchPhone('+256781127339'),
                            child: const Text(
                              '+256781127339',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.green),
                          const SizedBox(width: 10),
                          const Text(
                            'Tel 2: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () => _launchPhone('+256772540719'),
                            child: const Text(
                              '+256772540719',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Version Info
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.info, color: Colors.green),
                      const SizedBox(width: 10),
                      const Text(
                        'Version 1.5.1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Connect With Us Title
              const Text(
                'Connect with us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              // Email Us
              Card(
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.green),
                  title: const Text('Email Us'),
                  onTap:
                      () => _launchURL(
                        'mailto:info@iknowfarm.com',
                      ), // Replace with actual email
                ),
              ),
              // Visit our Website
              Card(
                child: ListTile(
                  leading: const Icon(Icons.language, color: Colors.green),
                  title: const Text('Visit our website'),
                  onTap:
                      () => _launchURL(
                        'https://www.iknowfarm.com',
                      ), // Replace with actual website
                ),
              ),
              // Like us on Facebook
              Card(
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/facebook.svg', // Use the SVG asset
                    width: 24,
                    height: 24,
                    color: Colors.blue, // Facebook color
                  ),
                  title: const Text('Like us on Facebook'),
                  onTap:
                      () => _launchURL(
                        'https://facebook.com/iknowfarm',
                      ), // Replace with actual Facebook
                ),
              ),
              // Follow us on Twitter
              Card(
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/twitter.svg', // Use the SVG asset.
                    width: 24,
                    height: 24,
                    color: Colors.blue, // Twitter Color.
                  ),
                  title: const Text('Follow us on Twitter'),
                  onTap:
                      () => _launchURL(
                        'https://twitter.com/iknowfarm',
                      ), // Replace with actual Twitter
                ),
              ),
              // Follow us on Instagram
              Card(
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/instagram.svg', // Use the SVG asset
                    width: 24,
                    height: 24,
                    color: Colors.purple,
                  ),
                  title: const Text('Follow us on Instagram'),
                  onTap:
                      () => _launchURL(
                        'https://instagram.com/iknowfarm',
                      ), // Replace with actual Instagram
                ),
              ),
              // Watch us on YouTube
              Card(
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/youtube.svg', // Use the SVG asset.
                    width: 24,
                    height: 24,
                    color: Colors.red,
                  ),
                  title: const Text('Watch us on YouTube'),
                  onTap:
                      () => _launchURL(
                        'https://youtube.com/iknowfarm',
                      ), // Replace with actual YouTube
                ),
              ),
              const SizedBox(height: 20),
              // WhatsApp Button
              ElevatedButton(
                onPressed: () => _launchWhatsApp('+263778686550'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // WhatsApp color
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/whatsapp.svg', // Use the WhatsApp SVG asset
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    const Text('Chat on WhatsApp'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
