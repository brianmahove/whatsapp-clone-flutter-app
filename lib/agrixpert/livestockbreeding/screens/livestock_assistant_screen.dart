import 'package:flutter/material.dart';

class LivestockAssistantScreen extends StatelessWidget {
  const LivestockAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livestock Breeding Assistant'), // Changed title
      ),
      body: const Center(
        child: Text(
          'Chat-style AI livestock breeding assistant will be implemented here.',
        ), // Changed text
      ),
    );
  }
}
