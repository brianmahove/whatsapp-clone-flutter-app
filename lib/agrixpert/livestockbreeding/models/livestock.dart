class Livestock {
  final String id;
  final String name;
  final String species; // Cattle, Pig, Sheep, etc.
  final String imageUrl;
  final Map<String, dynamic>
  traits; // Example: {'milkYield': 'high', 'diseaseResistance': true}

  Livestock({
    required this.id,
    required this.name,
    required this.species,
    required this.imageUrl,
    required this.traits,
  });
}

// Sample Livestock Data
List<Map<String, dynamic>> livestockData = [
  // Cattle
  {
    'id': 'cattle1',
    'name': 'High-milk Holstein',
    'species': 'Cattle',
    'imageUrl': 'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Holstein',
    'traits': {'milkYield': 'high', 'diseaseResistance': 'low'},
  },
  {
    'id': 'cattle2',
    'name': 'Disease-resistant Jersey',
    'species': 'Cattle',
    'imageUrl': 'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Jersey',
    'traits': {'milkYield': 'medium', 'diseaseResistance': 'high'},
  },
  {
    'id': 'cattle3',
    'name': 'Fast-growing Angus',
    'species': 'Cattle',
    'imageUrl': 'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Angus',
    'traits': {'growthRate': 'fast', 'meatLeanness': 'medium'},
  },
  {
    'id': 'cattle4',
    'name': 'Lean-meat Brahman',
    'species': 'Cattle',
    'imageUrl': 'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Brahman',
    'traits': {'growthRate': 'medium', 'meatLeanness': 'high'},
  },
  {
    'id': 'cattle5',
    'name': 'Heat-tolerant Zebu',
    'species': 'Cattle',
    'imageUrl': 'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Zebu',
    'traits': {'heatTolerance': true, 'coldTolerance': false},
  },
  {
    'id': 'cattle6',
    'name': 'Cold-tolerant Highland',
    'species': 'Cattle',
    'imageUrl': 'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Highland',
    'traits': {'heatTolerance': false, 'coldTolerance': true},
  },
  // Pigs
  {
    'id': 'pig1',
    'name': 'Large White',
    'species': 'Pigs',
    'imageUrl':
        'https://via.placeholder.com/150/FFC0CB/FFFFFF?Text=Large%20White',
    'traits': {'litterSize': 'large', 'meatQuality': 'medium'},
  },
  {
    'id': 'pig2',
    'name': 'Duroc',
    'species': 'Pigs',
    'imageUrl': 'https://via.placeholder.com/150/FFC0CB/FFFFFF?Text=Duroc',
    'traits': {'litterSize': 'medium', 'meatQuality': 'high'},
  },
  {
    'id': 'pig3',
    'name': 'Fast-reproducing Landrace',
    'species': 'Pigs',
    'imageUrl': 'https://via.placeholder.com/150/FFC0CB/FFFFFF?Text=Landrace',
    'traits': {'reproductionRate': 'high', 'hardiness': 'medium'},
  },
  {
    'id': 'pig4',
    'name': 'Hardy Hampshire',
    'species': 'Pigs',
    'imageUrl': 'https://via.placeholder.com/150/FFC0CB/FFFFFF?Text=Hampshire',
    'traits': {'reproductionRate': 'medium', 'hardiness': 'high'},
  },
  {
    'id': 'pig5',
    'name': 'Lean Pietrain',
    'species': 'Pigs',
    'imageUrl': 'https://via.placeholder.com/150/FFC0CB/FFFFFF?Text=Pietrain',
    'traits': {'meatLeanness': 'high', 'meatTenderness': 'medium'},
  },
  {
    'id': 'pig6',
    'name': 'Tender Berkshire',
    'species': 'Pigs',
    'imageUrl': 'https://via.placeholder.com/150/FFC0CB/FFFFFF?Text=Berkshire',
    'traits': {'meatLeanness': 'medium', 'meatTenderness': 'high'},
  },
  // Sheep
  {
    'id': 'sheep1',
    'name': 'Fine-wool Merino',
    'species': 'Sheep',
    'imageUrl': 'https://via.placeholder.com/150/8B4513/FFFFFF?Text=Merino',
    'traits': {'woolQuality': 'high', 'meatYield': 'medium'},
  },
  {
    'id': 'sheep2',
    'name': 'Meat-focused Dorper',
    'species': 'Sheep',
    'imageUrl': 'https://via.placeholder.com/150/8B4513/FFFFFF?Text=Dorper',
    'traits': {'woolQuality': 'low', 'meatYield': 'high'},
  },
  {
    'id': 'sheep3',
    'name': 'Hardy Karakul',
    'species': 'Sheep',
    'imageUrl': 'https://via.placeholder.com/150/8B4513/FFFFFF?Text=Karakul',
    'traits': {'hardiness': true, 'fertility': 'medium'},
  },
  {
    'id': 'sheep4',
    'name': 'Fertile Romney',
    'species': 'Sheep',
    'imageUrl': 'https://via.placeholder.com/150/8B4513/FFFFFF?Text=Romney',
    'traits': {'hardiness': 'medium', 'fertility': 'high'},
  },
  {
    'id': 'sheep5',
    'name': 'Parasite-resistant St. Croix',
    'species': 'Sheep',
    'imageUrl':
        'https://via.placeholder.com/150/8B4513/FFFFFF?Text=St.%20Croix',
    'traits': {'parasiteResistance': true, 'growthRate': 'medium'},
  },
  {
    'id': 'sheep6',
    'name': 'Fast-growing Suffolk',
    'species': 'Sheep',
    'imageUrl': 'https://via.placeholder.com/150/8B4513/FFFFFF?Text=Suffolk',
    'traits': {'parasiteResistance': false, 'growthRate': 'fast'},
  },
  // Goats
  {
    'id': 'goat1',
    'name': 'High-milk Saanen',
    'species': 'Goats',
    'imageUrl': 'https://via.placeholder.com/150/F5F5DC/000000?Text=Saanen',
    'traits': {'milkYield': 'high', 'diseaseResistance': 'medium'},
  },
  {
    'id': 'goat2',
    'name': 'Disease-resistant Boer',
    'species': 'Goats',
    'imageUrl': 'https://via.placeholder.com/150/F5F5DC/000000?Text=Boer',
    'traits': {'milkYield': 'medium', 'diseaseResistance': 'high'},
  },
  {
    'id': 'goat3',
    'name': 'Small Black Bengal',
    'species': 'Goats',
    'imageUrl': 'https://via.placeholder.com/150/F5F5DC/000000?Text=Bengal',
    'traits': {'size': 'small', 'growthRate': 'fast'},
  },
  {
    'id': 'goat4',
    'name': 'Fast-growing Nubian',
    'species': 'Goats',
    'imageUrl': 'https://via.placeholder.com/150/F5F5DC/000000?Text=Nubian',
    'traits': {'size': 'medium', 'growthRate': 'fast'},
  },
  {
    'id': 'goat5',
    'name': 'Hardy Kiko',
    'species': 'Goats',
    'imageUrl': 'https://via.placeholder.com/150/F5F5DC/000000?Text=Kiko',
    'traits': {'hardiness': true, 'fertility': 'medium'},
  },
  {
    'id': 'goat6',
    'name': 'Fertile Alpine',
    'species': 'Goats',
    'imageUrl': 'https://via.placeholder.com/150/F5F5DC/000000?Text=Alpine',
    'traits': {'hardiness': 'medium', 'fertility': 'high'},
  },
  // Poultry (Chickens)
  {
    'id': 'chicken1',
    'name': 'High-laying Leghorn',
    'species': 'Poultry',
    'imageUrl': 'https://via.placeholder.com/150/FFFACD/000000?Text=Leghorn',
    'traits': {'eggLayingRate': 'high', 'diseaseResistance': 'low'},
  },
  {
    'id': 'chicken2',
    'name': 'Disease-resistant Rhode Island',
    'species': 'Poultry',
    'imageUrl':
        'https://via.placeholder.com/150/FFFACD/000000?Text=Rhode%20Island',
    'traits': {'eggLayingRate': 'medium', 'diseaseResistance': 'high'},
  },
  {
    'id': 'chicken3',
    'name': 'Broiler Cobb',
    'species': 'Poultry',
    'imageUrl': 'https://via.placeholder.com/150/FFFACD/000000?Text=Cobb',
    'traits': {'meatGrowthRate': 'fast', 'hardiness': 'medium'},
  },
  {
    'id': 'chicken4',
    'name': 'Hardy Australorp',
    'species': 'Poultry',
    'imageUrl': 'https://via.placeholder.com/150/FFFACD/000000?Text=Australorp',
    'traits': {'meatGrowthRate': 'medium', 'hardiness': 'high'},
  },
  {
    'id': 'chicken5',
    'name': 'Colorful Bantam',
    'species': 'Poultry',
    'imageUrl': 'https://via.placeholder.com/150/FFFACD/000000?Text=Bantam',
    'traits': {'ornamentalValue': true, 'eggLayingRate': 'low'},
  },
  {
    'id': 'chicken6',
    'name': 'Large Orpington',
    'species': 'Poultry',
    'imageUrl': 'https://via.placeholder.com/150/FFFACD/000000?Text=Orpington',
    'traits': {'size': 'large', 'eggLayingRate': 'medium'},
  },
  // Turkeys
  {
    'id': 'turkey1',
    'name': 'Large Broad-Breasted White',
    'species': 'Turkeys',
    'imageUrl': 'https://via.placeholder.com/150/D2B48C/FFFFFF?Text=BB%20White',
    'traits': {'size': 'large', 'diseaseResistance': 'low'},
  },
  {
    'id': 'turkey2',
    'name': 'Hardy Heritage Turkey',
    'species': 'Turkeys',
    'imageUrl': 'https://via.placeholder.com/150/D2B48C/FFFFFF?Text=Heritage',
    'traits': {'size': 'medium', 'diseaseResistance': 'high'},
  },
  // Ducks
  {
    'id': 'duck1',
    'name': 'Egg-laying Khaki Campbell',
    'species': 'Ducks',
    'imageUrl':
        'https://via.placeholder.com/150/AFEEEE/000000?Text=Khaki%20Campbell',
    'traits': {'eggLayingRate': 'high', 'size': 'medium'},
  },
  {
    'id': 'duck2',
    'name': 'Muscovy',
    'species': 'Ducks',
    'imageUrl': 'https://via.placeholder.com/150/AFEEEE/000000?Text=Muscovy',
    'traits': {'eggLayingRate': 'medium', 'size': 'large'},
  },
  // Rabbits
  {
    'id': 'rabbit1',
    'name': 'Fast-growing New Zealand',
    'species': 'Rabbits',
    'imageUrl':
        'https://via.placeholder.com/150/F8F8FF/000000?Text=New%20Zealand',
    'traits': {'growthRate': 'fast', 'meatYield': 'medium'},
  },
  {
    'id': 'rabbit2',
    'name': 'Meat-heavy Flemish Giant',
    'species': 'Rabbits',
    'imageUrl':
        'https://via.placeholder.com/150/F8F8FF/000000?Text=Flemish%20Giant',
    'traits': {'growthRate': 'medium', 'meatYield': 'high'},
  },
  {
    'id': 'rabbit3',
    'name': 'High-fertility Dutch',
    'species': 'Rabbits',
    'imageUrl': 'https://via.placeholder.com/150/F8F8FF/000000?Text=Dutch',
    'traits': {'fertilityRate': 'high', 'temperament': 'calm'},
  },
  {
    'id': 'rabbit4',
    'name': 'Calm-temperament Rex',
    'species': 'Rabbits',
    'imageUrl': 'https://via.placeholder.com/150/F8F8FF/000000?Text=Rex',
    'traits': {'fertilityRate': 'medium', 'temperament': 'calm'},
  },
];

// Convert the raw data into Livestock objects
List<Livestock> livestock =
    livestockData
        .map(
          (data) => Livestock(
            id: data['id'],
            name: data['name'],
            species: data['species'],
            imageUrl: data['imageUrl'],
            traits: Map<String, dynamic>.from(data['traits']),
          ),
        )
        .toList();
