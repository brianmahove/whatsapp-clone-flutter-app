import 'package:flutter/material.dart';

class PlantBreedingTutorialScreen extends StatelessWidget {
  const PlantBreedingTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plant Breeding Tutorial')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the SmartBreed Plant Breeding Tutorial!',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'This guide will walk you through the basic steps of using the breeding simulation feature to explore potential offspring traits based on selected parent plants.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, '1. Accessing the Breeding Simulation'),
            const SizedBox(height: 8.0),
            const Text(
              'From the main Plant Catalog screen, tap the \'merge\' icon ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Row(
              children: [
                Icon(Icons.merge, size: 24.0, color: Colors.green),
                Text(
                  ' located at the bottom right of the screen.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'This will take you to the \'Cross-Breeding Simulation\' screen.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, '2. Selecting Parent Plants'),
            const SizedBox(height: 8.0),
            const Text(
              'On the Breeding Simulation screen, you will see two cards: \'Select Parent 1\' and \'Select Parent 2\'.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tap on either of these cards to open the \'Plant Selection\' screen.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Here, you will see a list of all the plants in your catalog. Tap on the plant you wish to select as a parent.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'The selected plant\'s name and image (if available) will now appear on the respective \'Select Parent\' card on the Breeding Simulation screen.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, '3. Simulating Cross-Breeding'),
            const SizedBox(height: 8.0),
            const Text(
              'Once you have selected both Parent 1 and Parent 2, the \'Simulate Cross-Breeding\' button at the bottom will become active (colored green).',
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
              'After the simulation is complete, a section will appear below the \'Simulate Cross-Breeding\' button displaying the results.',
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
              '- \'Compatibility Score\': A basic score indicating the compatibility of the selected breeding pair, primarily based on whether they are of the same category.',
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
                Icon(Icons.search, size: 24.0, color: Colors.green),
                Text(
                  ' on the Plant Catalog screen, will eventually provide AI-powered recommendations for breeding pairs based on desired offspring traits.',
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
        color: Colors.green.shade700,
      ),
    );
  }
}
