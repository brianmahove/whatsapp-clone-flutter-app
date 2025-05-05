import 'package:whatsapp/agrixpert/livestockbreeding/models/livestock.dart'; // Changed import

class BreedingResult {
  final Livestock parent1; // Changed type
  final Livestock parent2; // Changed type
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
