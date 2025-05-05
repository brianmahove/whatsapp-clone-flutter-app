import 'dart:core';

import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/plantbreeding/models/breeding_result.dart';
import 'dart:math';

import 'package:whatsapp/agrixpert/plantbreeding/models/plant.dart';

class BreedingSuggestionsScreen extends StatelessWidget {
  const BreedingSuggestionsScreen({super.key});

  // Basic logic to suggest top breeding pairs based on desired traits
  // This will need significant improvement with AI integration
  List<BreedingResult> _suggestTopPairs(
    List<Plant> allPlants,
    Map<String, dynamic> desiredTraits,
  ) {
    List<BreedingResult> suggestions = [];
    for (int i = 0; i < allPlants.length; i++) {
      for (int j = i + 1; j < allPlants.length; j++) {
        final parent1 = allPlants[i];
        final parent2 = allPlants[j];
        final result = _simulateCrossBreeding(parent1, parent2);

        // Simple scoring based on desired traits
        double score = 0.0;
        desiredTraits.forEach((key, desiredValue) {
          if (result.offspringTraits.containsKey(key)) {
            if (result.offspringTraits[key] == desiredValue) {
              score += 1.0;
            }
          }
        });
        if (score > 0) {
          suggestions.add(
            result
              ..compatibilityScore =
                  result.compatibilityScore + (score / desiredTraits.length),
          );
        }
      }
    }
    suggestions.sort(
      (a, b) => b.compatibilityScore.compareTo(a.compatibilityScore),
    );
    return suggestions.take(5).toList(); // Suggest top 5
  }

  BreedingResult _simulateCrossBreeding(Plant parent1, Plant parent2) {
    Map<String, dynamic> offspringTraits = {};
    String reasoning = '';
    double score = 0.0;
    String recommendation = '';

    // Basic trait inheritance logic (can be expanded)
    parent1.traits.forEach((key, value1) {
      if (parent2.traits.containsKey(key)) {
        final value2 = parent2.traits[key];
        // Simple averaging or dominant trait inheritance
        if (value1 is bool && value2 is bool) {
          offspringTraits[key] = value1 || value2;
        } else if (value1 is String && value2 is String) {
          // For simplicity, choose one or the other randomly
          offspringTraits[key] = Random().nextBool() ? value1 : value2;
        }
        reasoning += 'Offspring inherits $key from both parents. ';
        score += 0.5;
      } else {
        offspringTraits[key] = value1;
        reasoning += 'Offspring inherits $key from ${parent1.name}. ';
      }
    });
    parent2.traits.forEach((key, value) {
      if (!offspringTraits.containsKey(key)) {
        offspringTraits[key] = value;
        reasoning += 'Offspring inherits $key from ${parent2.name}. ';
      }
    });

    // Basic compatibility score and recommendation (improve with AI)
    if (parent1.category == parent2.category) {
      score += 0.2;
      reasoning += 'Both parents are from the same category. ';
      recommendation =
          'This breeding pair has potential for combining desirable traits within the same crop category.';
    } else {
      reasoning +=
          'Parents are from different categories, compatibility might be lower for some traits. ';
      recommendation =
          'Consider the potential benefits and challenges of cross-breeding different crop categories.';
    }
    score = score.clamp(0.0, 1.0);

    return BreedingResult(
      parent1: parent1,
      parent2: parent2,
      offspringTraits: offspringTraits,
      compatibilityReasoning: reasoning,
      compatibilityScore: score,
      recommendation: recommendation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breeding Suggestions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Looking for specific traits?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
            // Placeholder for user input of desired traits
            const Text(
              'This section will eventually allow you to specify desired traits and get AI-powered suggestions.',
            ),
            const SizedBox(height: 24.0),
            Text(
              'Top Suggested Breeding Pairs (Basic Logic):',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: ListView.builder(
                itemCount:
                    _suggestTopPairs(plants, {
                      'yield': 'high',
                      'diseaseResistance': true,
                    }).length,
                itemBuilder: (context, index) {
                  final suggestion =
                      _suggestTopPairs(plants, {
                        'yield': 'high',
                        'diseaseResistance': true,
                      })[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${suggestion.parent1.name} + ${suggestion.parent2.name}',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Compatibility: ${(suggestion.compatibilityScore * 100).toStringAsFixed(1)}%',
                          ),
                          Text(
                            'Reasoning: ${suggestion.compatibilityReasoning.substring(0, suggestion.compatibilityReasoning.length > 80 ? 80 : suggestion.compatibilityReasoning.length)}...',
                          ),
                          // Display offspring traits or a summary here
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a screen where users can input desired traits
          // For now, just a placeholder
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Feature to specify desired traits coming soon!'),
            ),
          );
        },
        backgroundColor: Colors.green.shade600,
        child: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}
