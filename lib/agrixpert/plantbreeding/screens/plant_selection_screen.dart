import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/plantbreeding/models/plant.dart';

class PlantSelectionScreen extends StatelessWidget {
  final String title;
  final Function(Plant) onPlantSelected;

  const PlantSelectionScreen({
    super.key,
    required this.title,
    required this.onPlantSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  plant.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.error_outline),
                ),
              ),
            ),
            title: Text(plant.name),
            subtitle: Text(plant.category),
            onTap: () {
              onPlantSelected(plant);
            },
          );
        },
      ),
    );
  }
}
