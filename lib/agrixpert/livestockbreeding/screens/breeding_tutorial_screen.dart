import 'package:flutter/material.dart';

class BreedingTutorialScreen extends StatelessWidget {
  const BreedingTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breeding Tutorial')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the SmartHerd Breeding Tutorial!',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'This guide will walk you through the basic steps of using the breeding simulation feature to explore potential offspring traits based on selected parents.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, '1. Accessing the Breeding Simulation'),
            const SizedBox(height: 8.0),
            const Text(
              'From the main Livestock Catalog screen, tap the \'merge\' icon ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Row(
              children: [
                Icon(Icons.merge, size: 24.0, color: Colors.brown),
                Text(
                  ' located at the bottom right of the screen.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'This will take you to the \'Livestock Breeding Simulation\' screen.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, '2. Selecting Parent Animals'),
            const SizedBox(height: 8.0),
            const Text(
              'On the Breeding Simulation screen, you will see two cards: \'Select Parent 1\' and \'Select Parent 2\'.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tap on either of these cards to open the \'Livestock Selection\' screen.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Here, you will see a list of all the livestock in your catalog. Tap on the animal you wish to select as a parent.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'The selected animal\'s name and image (if available) will now appear on the respective \'Select Parent\' card on the Breeding Simulation screen.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, '3. Simulating the Breeding'),
            const SizedBox(height: 8.0),
            const Text(
              'Once you have selected both Parent 1 and Parent 2, the \'Simulate Breeding\' button at the bottom will become active (colored brown).',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tap this button to run a basic simulation of potential offspring traits based on the genetic information of the selected parents.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, '4. Viewing the Breeding Results'),
            const SizedBox(height: 8.0),
            const Text(
              'After the simulation is complete, a section will appear below the \'Simulate Breeding\' button displaying the results.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'This section includes:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- \'Offspring Traits\': A list of potential traits the offspring might inherit, based on a simplified inheritance model.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- \'Compatibility Score\': A basic score indicating the compatibility of the selected breeding pair, primarily based on whether they are of the same species.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- \'Reasoning\': A brief explanation of how the offspring traits and compatibility score were determined in this basic simulation.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- \'Recommendation\': A general suggestion based on the compatibility of the parents.',
              style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(
              context,
              '5. Exploring Breeding Suggestions (Coming Soon)',
            ),
            const SizedBox(height: 8.0),
            const Text(
              'The \'Breeding Suggestions\' feature, accessible via the \'search\' icon ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Row(
              children: [
                Icon(Icons.search, size: 24.0, color: Colors.brown),
                Text(
                  ' on the Livestock Catalog screen, will eventually provide AI-powered recommendations for breeding pairs based on desired offspring traits.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Stay tuned for updates on this exciting feature!',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 32.0),
            const Text(
              'This is a basic simulation to help you explore potential breeding outcomes. As the app evolves, we will integrate more sophisticated AI models for more accurate and insightful predictions.',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
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
        color: Colors.brown.shade700,
      ),
    );
  }
}
