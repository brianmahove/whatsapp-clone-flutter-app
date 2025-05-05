import 'package:whatsapp/agrixpert/plantbreeding/models/plant.dart';

class BreedingResult {
  final Plant parent1;
  final Plant parent2;
  final Map<String, dynamic> offspringTraits;
  final String compatibilityReasoning;
  double compatibilityScore;
  final String recommendation;

  BreedingResult({
    required this.parent1,
    required this.parent2,
    required this.offspringTraits,
    required this.compatibilityReasoning,
    required this.compatibilityScore,
    required this.recommendation,
  });
}
