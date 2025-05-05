class Plant {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final Map<String, dynamic>
  traits; // Example: {'yield': 'high', 'droughtTolerance': true}

  Plant({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.traits,
  });
}

// Sample Plant Data (Move to a data service or database later)
List<Map<String, dynamic>> plantData = [
  {
    'id': 'wheat1',
    'name': 'High-yield Wheat',
    'category': 'Cereal Crops',
    'imageUrl':
        'https://via.placeholder.com/150/8FBC8F/FFFFFF?Text=High-yield%20Wheat',
    'traits': {'yield': 'high', 'droughtTolerance': false},
  },
  {
    'id': 'wheat2',
    'name': 'Drought-tolerant Wheat',
    'category': 'Cereal Crops',
    'imageUrl':
        'https://via.placeholder.com/150/8FBC8F/FFFFFF?Text=Drought-tolerant%20Wheat',
    'traits': {'yield': 'medium', 'droughtTolerance': true},
  },
  {
    'id': 'rice1',
    'name': 'Early-maturing Rice',
    'category': 'Cereal Crops',
    'imageUrl':
        'https://via.placeholder.com/150/8FBC8F/FFFFFF?Text=Early-maturing%20Rice',
    'traits': {'maturity': 'early', 'diseaseResistance': false},
  },
  {
    'id': 'rice2',
    'name': 'Disease-resistant Rice',
    'category': 'Cereal Crops',
    'imageUrl':
        'https://via.placeholder.com/150/8FBC8F/FFFFFF?Text=Disease-resistant%20Rice',
    'traits': {'maturity': 'medium', 'diseaseResistance': true},
  },
  {
    'id': 'maize1',
    'name': 'Tall Maize',
    'category': 'Cereal Crops',
    'imageUrl':
        'https://via.placeholder.com/150/8FBC8F/FFFFFF?Text=Tall%20Maize',
    'traits': {'height': 'tall', 'stalkStrength': 'average'},
  },
  {
    'id': 'maize2',
    'name': 'Short Maize',
    'category': 'Cereal Crops',
    'imageUrl':
        'https://via.placeholder.com/150/8FBC8F/FFFFFF?Text=Short%20Maize',
    'traits': {'height': 'short', 'stalkStrength': 'strong'},
  },
  {
    'id': 'potato1',
    'name': 'Large Potato',
    'category': 'Root & Tuber Crops',
    'imageUrl':
        'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Large%20Potato',
    'traits': {'size': 'large', 'scabResistance': false},
  },
  {
    'id': 'potato2',
    'name': 'Scab-resistant Potato',
    'category': 'Root & Tuber Crops',
    'imageUrl':
        'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Scab-resistant%20Potato',
    'traits': {'size': 'medium', 'scabResistance': true},
  },
  {
    'id': 'cassava1',
    'name': 'High-starch Cassava',
    'category': 'Root & Tuber Crops',
    'imageUrl':
        'https://via.placeholder.com/150/A0522D/FFFFFF?Text=High-starch%20Cassava',
    'traits': {'starchContent': 'high', 'droughtTolerance': false},
  },
  {
    'id': 'cassava2',
    'name': 'Drought-resistant Cassava',
    'category': 'Root & Tuber Crops',
    'imageUrl':
        'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Drought-resistant%20Cassava',
    'traits': {'starchContent': 'medium', 'droughtTolerance': true},
  },
  {
    'id': 'yam1',
    'name': 'Sweet Yam',
    'category': 'Root & Tuber Crops',
    'imageUrl':
        'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Sweet%20Yam',
    'traits': {'sweetness': 'high', 'maturity': 'medium'},
  },
  {
    'id': 'yam2',
    'name': 'Fast-growing Yam',
    'category': 'Root & Tuber Crops',
    'imageUrl':
        'https://via.placeholder.com/150/A0522D/FFFFFF?Text=Fast-growing%20Yam',
    'traits': {'sweetness': 'medium', 'maturity': 'early'},
  },
  {
    'id': 'tomato1',
    'name': 'Juicy Tomato',
    'category': 'Vegetables',
    'imageUrl':
        'https://via.placeholder.com/150/DC143C/FFFFFF?Text=Juicy%20Tomato',
    'traits': {'juiciness': 'high', 'diseaseResistance': false},
  },
  {
    'id': 'tomato2',
    'name': 'Disease-resistant Tomato',
    'category': 'Vegetables',
    'imageUrl':
        'https://via.placeholder.com/150/DC143C/FFFFFF?Text=Disease-resistant%20Tomato',
    'traits': {'juiciness': 'medium', 'diseaseResistance': true},
  },
  {
    'id': 'eggplant1',
    'name': 'Bitter Eggplant',
    'category': 'Vegetables',
    'imageUrl':
        'https://via.placeholder.com/150/4B0082/FFFFFF?Text=Bitter%20Eggplant',
    'traits': {'bitterness': 'high', 'flavor': 'average'},
  },
  {
    'id': 'eggplant2',
    'name': 'Sweet Eggplant',
    'category': 'Vegetables',
    'imageUrl':
        'https://via.placeholder.com/150/4B0082/FFFFFF?Text=Sweet%20Eggplant',
    'traits': {'bitterness': 'low', 'flavor': 'good'},
  },
  {
    'id': 'pepper1',
    'name': 'Spicy Pepper',
    'category': 'Vegetables',
    'imageUrl':
        'https://via.placeholder.com/150/FF4500/FFFFFF?Text=Spicy%20Pepper',
    'traits': {'spiciness': 'high', 'size': 'medium'},
  },
  {
    'id': 'pepper2',
    'name': 'Big Pepper',
    'category': 'Vegetables',
    'imageUrl':
        'https://via.placeholder.com/150/FF4500/FFFFFF?Text=Big%20Pepper',
    'traits': {'spiciness': 'medium', 'size': 'large'},
  },
  {
    'id': 'banana1',
    'name': 'Seedless Banana',
    'category': 'Fruits',
    'imageUrl':
        'https://via.placeholder.com/150/FFD700/000000?Text=Seedless%20Banana',
    'traits': {'seedless': true, 'sweetness': 'medium'},
  },
  {
    'id': 'banana2',
    'name': 'Sweet Banana',
    'category': 'Fruits',
    'imageUrl':
        'https://via.placeholder.com/150/FFD700/000000?Text=Sweet%20Banana',
    'traits': {'seedless': false, 'sweetness': 'high'},
  },
  {
    'id': 'apple1',
    'name': 'Large Apple',
    'category': 'Fruits',
    'imageUrl':
        'https://via.placeholder.com/150/B22222/FFFFFF?Text=Large%20Apple',
    'traits': {'size': 'large', 'color': 'green'},
  },
  {
    'id': 'apple2',
    'name': 'Red Apple',
    'category': 'Fruits',
    'imageUrl':
        'https://via.placeholder.com/150/B22222/FFFFFF?Text=Red%20Apple',
    'traits': {'size': 'medium', 'color': 'red'},
  },
  {
    'id': 'mango1',
    'name': 'Sour Mango',
    'category': 'Fruits',
    'imageUrl':
        'https://via.placeholder.com/150/FFA07A/FFFFFF?Text=Sour%20Mango',
    'traits': {'sourness': 'high', 'sweetness': 'low'},
  },
  {
    'id': 'mango2',
    'name': 'Sweet Mango',
    'category': 'Fruits',
    'imageUrl':
        'https://via.placeholder.com/150/FFA07A/FFFFFF?Text=Sweet%20Mango',
    'traits': {'sourness': 'low', 'sweetness': 'high'},
  },
  {
    'id': 'soybean1',
    'name': 'Oil-rich Soybean',
    'category': 'Legumes',
    'imageUrl':
        'https://via.placeholder.com/150/F0E68C/000000?Text=Oil-rich%20Soybean',
    'traits': {'oilContent': 'high', 'pestResistance': false},
  },
  {
    'id': 'soybean2',
    'name': 'Pest-resistant Soybean',
    'category': 'Legumes',
    'imageUrl':
        'https://via.placeholder.com/150/F0E68C/000000?Text=Pest-resistant%20Soybean',
    'traits': {'oilContent': 'medium', 'pestResistance': true},
  },
  {
    'id': 'bean1',
    'name': 'Bush Bean',
    'category': 'Legumes',
    'imageUrl':
        'https://via.placeholder.com/150/F0E68C/000000?Text=Bush%20Bean',
    'traits': {'growthHabit': 'bush', 'productivity': 'medium'},
  },
  {
    'id': 'bean2',
    'name': 'Climbing Bean',
    'category': 'Legumes',
    'imageUrl':
        'https://via.placeholder.com/150/F0E68C/000000?Text=Climbing%20Bean',
    'traits': {'growthHabit': 'climbing', 'productivity': 'high'},
  },
  {
    'id': 'pea1',
    'name': 'Black Eyed Pea',
    'category': 'Legumes',
    'imageUrl':
        'https://via.placeholder.com/150/F0E68C/000000?Text=Black%20Eyed%20Pea',
    'traits': {'maturity': 'medium', 'proteinContent': 'high'},
  },
  {
    'id': 'pea2',
    'name': 'Fast-growing Pea',
    'category': 'Legumes',
    'imageUrl':
        'https://via.placeholder.com/150/F0E68C/000000?Text=Fast-growing%20Pea',
    'traits': {'maturity': 'early', 'proteinContent': 'medium'},
  },
  {
    'id': 'sunflower1',
    'name': 'High-oil Sunflower',
    'category': 'Oil Crops',
    'imageUrl':
        'https://via.placeholder.com/150/FFFF00/000000?Text=High-oil%20Sunflower',
    'traits': {'oilYield': 'high', 'droughtTolerance': false},
  },
  {
    'id': 'sunflower2',
    'name': 'Drought-tolerant Sunflower',
    'category': 'Oil Crops',
    'imageUrl':
        'https://via.placeholder.com/150/FFFF00/000000?Text=Drought-tolerant%20Sunflower',
    'traits': {'oilYield': 'medium', 'droughtTolerance': true},
  },
  {
    'id': 'canola1',
    'name': 'Large-seed Canola',
    'category': 'Oil Crops',
    'imageUrl':
        'https://via.placeholder.com/150/FFFF00/000000?Text=Large-seed%20Canola',
    'traits': {'seedSize': 'large', 'diseaseResistance': false},
  },
  {
    'id': 'canola2',
    'name': 'Disease-resistant Canola',
    'category': 'Oil Crops',
    'imageUrl':
        'https://via.placeholder.com/150/FFFF00/000000?Text=Disease-resistant%20Canola',
    'traits': {'seedSize': 'medium', 'diseaseResistance': true},
  },
  {
    'id': 'basil1',
    'name': 'Tall Basil',
    'category': 'Spices & Herbs',
    'imageUrl':
        'https://via.placeholder.com/150/008000/FFFFFF?Text=Tall%20Basil',
    'traits': {'height': 'tall', 'aroma': 'medium'},
  },
  {
    'id': 'basil2',
    'name': 'Aromatic Basil',
    'category': 'Spices & Herbs',
    'imageUrl':
        'https://via.placeholder.com/150/008000/FFFFFF?Text=Aromatic%20Basil',
    'traits': {'height': 'medium', 'aroma': 'high'},
  },
  {
    'id': 'chili1',
    'name': 'Spicy Chili',
    'category': 'Spices & Herbs',
    'imageUrl':
        'https://via.placeholder.com/150/FF4500/FFFFFF?Text=Spicy%20Chili',
    'traits': {'spiciness': 'high', 'size': 'small'},
  },
  {
    'id': 'chili2',
    'name': 'Large Chili',
    'category': 'Spices & Herbs',
    'imageUrl':
        'https://www.google.com/search?q=https://via.placeholder.com/150/FF4500/FFFFFF%3FText%3DLarge%2520Chili',
    'traits': {'spiciness': 'medium', 'size': 'large'},
  },
  {
    'id': 'ginger1',
    'name': 'Dry Ginger',
    'category': 'Spices & Herbs',
    'imageUrl':
        'https://www.google.com/search?q=https://via.placeholder.com/150/B8860B/FFFFFF%3FText%3DDry%2520Ginger',
    'traits': {'moisture': 'low', 'flavorIntensity': 'high'},
  },
  {
    'id': 'ginger2',
    'name': 'Juicy Ginger',
    'category': 'Spices & Herbs',
    'imageUrl':
        'https://www.google.com/search?q=https://via.placeholder.com/150/B8860B/FFFFFF%3FText%3DJuicy%2520Ginger',
    'traits': {'moisture': 'high', 'flavorIntensity': 'medium'},
  },
];

// Convert the raw data into Plant objects
List<Plant> plants =
    plantData
        .map(
          (data) => Plant(
            id: data['id'],
            name: data['name'],
            category: data['category'],
            imageUrl: data['imageUrl'],
            traits: Map<String, dynamic>.from(data['traits']),
          ),
        )
        .toList();
