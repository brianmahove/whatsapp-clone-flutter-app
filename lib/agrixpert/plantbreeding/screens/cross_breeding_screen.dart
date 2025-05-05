import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/plantbreeding/models/breeding_result.dart';
import 'package:whatsapp/agrixpert/plantbreeding/models/plant.dart';
import 'package:whatsapp/agrixpert/plantbreeding/screens/plant_selection_screen.dart';

class CrossBreedingScreen extends StatefulWidget {
  const CrossBreedingScreen({super.key});

  @override
  State<CrossBreedingScreen> createState() => _CrossBreedingScreenState();
}

class _CrossBreedingScreenState extends State<CrossBreedingScreen> {
  Plant? _parent1;
  Plant? _parent2;
  BreedingResult? _breedingResult;

  Future<void> _selectParent1(BuildContext context) async {
    final Plant? selectedPlant = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => PlantSelectionScreen(
              title: 'Select Parent 1',
              onPlantSelected: (plant) {
                Navigator.pop(context, plant);
              },
            ),
      ),
    );
    if (selectedPlant != null) {
      setState(() {
        _parent1 = selectedPlant;
        _breedingResult = null; // Reset result on new selection
      });
    }
  }

  Future<void> _selectParent2(BuildContext context) async {
    final Plant? selectedPlant = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => PlantSelectionScreen(
              title: 'Select Parent 2',
              onPlantSelected: (plant) {
                Navigator.pop(context, plant);
              },
            ),
      ),
    );
    if (selectedPlant != null) {
      setState(() {
        _parent2 = selectedPlant;
        _breedingResult = null; // Reset result on new selection
      });
    }
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
        reasoning +=
            'Offspring inherits $key from <span class="math-inline">{parent2.name}. ';
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
      appBar: AppBar(title: const Text('Cross-Breeding Simulation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () => _selectParent1(context),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.arrow_downward,
                        size: 32,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        _parent1?.name ?? 'Select Parent 1',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      if (_parent1?.imageUrl != null) ...[
                        const SizedBox(height: 8.0),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              _parent1!.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      const Icon(Icons.error_outline),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => _selectParent2(context),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.arrow_upward,
                        size: 32,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        _parent2?.name ?? 'Select Parent 2',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      if (_parent2?.imageUrl != null) ...[
                        const SizedBox(height: 8.0),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              _parent2!.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      const Icon(Icons.error_outline),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed:
                  (_parent1 != null && _parent2 != null)
                      ? () {
                        setState(() {
                          _breedingResult = _simulateCrossBreeding(
                            _parent1!,
                            _parent2!,
                          );
                        });
                      }
                      : null,
              child: const Text('Simulate Cross-Breeding'),
            ),
            const SizedBox(height: 24.0),
            if (_breedingResult != null) ...[
              Text(
                'Offspring Traits:',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 4.0,
                children:
                    _breedingResult!.offspringTraits.entries.map((entry) {
                      return Chip(
                        label: Text(
                          '</span>{entry.key}: ${entry.value}',
                          style: const TextStyle(fontSize: 10),
                        ),
                        backgroundColor: Colors.green.shade200,
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Compatibility Score: ${(_breedingResult!.compatibilityScore * 100).toStringAsFixed(1)}%',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Reasoning: ${_breedingResult!.compatibilityReasoning}',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Recommendation: ${_breedingResult!.recommendation}',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
