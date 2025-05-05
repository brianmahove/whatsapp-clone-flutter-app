import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy for AgriXpert',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Effective Date: [Insert Date]',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
            Text(
              '1. Information We Collect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We collect the following types of information:\n'
              '- Personal Information: When you sign up for an account or use certain features, we may collect personal details such as your name, email address, phone number, and location data.\n'
              '- Usage Data: We automatically collect information about how you interact with our app, such as your device type, operating system, IP address, and usage patterns.\n'
              '- Weather Data: We collect real-time weather data, including location-based forecasts, to provide relevant insights for farming decisions.\n'
              '- Health and Farming Data: If you choose to log farming activities, crops, or livestock details, we will collect and store this data to provide personalized recommendations.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '2. How We Use Your Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We use your information to:\n'
              '- Provide personalized weather forecasts, crop/livestock management tips, and AI-driven insights.\n'
              '- Improve the functionality and performance of the app.\n'
              '- Communicate important updates, including service-related issues or updates to the privacy policy.\n'
              '- Share relevant market and expert resources based on your preferences and activity.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '3. Sharing Your Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We do not sell or rent your personal data to third parties. However, we may share your data with trusted third parties for the following purposes:\n'
              '- Service Providers: We may share data with third-party providers who assist us in running our app (e.g., cloud storage providers, weather APIs, etc.).\n'
              '- Legal Compliance: We may disclose information if required by law or if we believe such action is necessary to comply with legal obligations, protect our rights, or prevent fraud.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '4. Data Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We take reasonable measures to protect your personal data from unauthorized access, alteration, or disclosure. We use industry-standard encryption methods for storing sensitive data. However, please note that no data transmission over the internet can be guaranteed 100% secure.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '5. Your Rights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You have the right to:\n'
              '- Access and correct the personal information we have about you.\n'
              '- Request the deletion of your account and personal data (subject to certain exceptions).\n'
              '- Opt-out of receiving marketing communications from us.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '6. Children’s Privacy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children. If we discover that a child under 13 has provided us with personal data, we will take steps to delete such information.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '7. Cookies and Tracking Technologies',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may use cookies and similar tracking technologies to enhance your experience with our app. These technologies help us analyze app usage, improve functionality, and provide personalized content.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '8. Changes to This Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We reserve the right to update this privacy policy at any time. Any changes will be posted on this page, and the "Effective Date" will be updated accordingly. We encourage you to review this policy periodically for updates.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '9. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions about this Privacy Policy or your personal data, please contact us at:\n'
              'Email: [Insert Contact Email]\n'
              'Address: [Insert Physical Address]',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
