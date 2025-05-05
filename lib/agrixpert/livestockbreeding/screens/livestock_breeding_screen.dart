import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/livestockbreeding/models/breeding_result.dart';
import 'package:whatsapp/agrixpert/livestockbreeding/models/livestock.dart';
import 'package:whatsapp/agrixpert/livestockbreeding/screens/livestock_selection_screen.dart';

class LivestockBreedingScreen extends StatefulWidget {
  const LivestockBreedingScreen({super.key});

  @override
  State<LivestockBreedingScreen> createState() =>
      _LivestockBreedingScreenState();
}

class _LivestockBreedingScreenState extends State<LivestockBreedingScreen> {
  Livestock? _parent1;
  Livestock? _parent2;
  BreedingResult? _breedingResult;

  Future<void> _selectParent1(BuildContext context) async {
    final Livestock? selectedLivestock = await Navigator.push(
      // Changed type
      context,
      MaterialPageRoute(
        builder:
            (context) => LivestockSelectionScreen(
              // Changed screen
              title: 'Select Parent 1',
              onLivestockSelected: (livestock) {
                // Changed type and callback name
                Navigator.pop(context, livestock);
              },
            ),
      ),
    );
    if (selectedLivestock != null) {
      setState(() {
        _parent1 = selectedLivestock;
        _breedingResult = null; // Reset result on new selection
      });
    }
  }

  Future<void> _selectParent2(BuildContext context) async {
    final Livestock? selectedLivestock = await Navigator.push(
      // Changed type
      context,
      MaterialPageRoute(
        builder:
            (context) => LivestockSelectionScreen(
              // Changed screen
              title: 'Select Parent 2',
              onLivestockSelected: (livestock) {
                // Changed type and callback name
                Navigator.pop(context, livestock);
              },
            ),
      ),
    );
    if (selectedLivestock != null) {
      setState(() {
        _parent2 = selectedLivestock;
        _breedingResult = null; // Reset result on new selection
      });
    }
  }

  BreedingResult _simulateCrossBreeding(Livestock parent1, Livestock parent2) {
    // Changed type
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
    if (parent1.species == parent2.species) {
      // Changed to species
      score += 0.2;
      reasoning += 'Both parents are from the same species. ';
      recommendation =
          'This breeding pair has potential for combining desirable traits within the same livestock species.';
    } else {
      reasoning +=
          'Parents are from different species, compatibility might be lower for some traits. ';
      recommendation =
          'Consider the potential benefits and challenges of cross-breeding different livestock species.';
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
      appBar: AppBar(
        title: const Text('Livestock Breeding Simulation'), // Changed title
      ),
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
              child: const Text('Simulate Breeding'), // Changed text
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
                          '${entry.key}: ${entry.value}',
                          style: const TextStyle(fontSize: 10),
                        ),
                        backgroundColor: Colors.brown.shade200, // Changed color
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
