import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:whatsapp/agrixpert/plantbreeding/models/plant.dart';
import 'package:whatsapp/agrixpert/plantbreeding/screens/cross_breeding_screen.dart';
import 'package:whatsapp/agrixpert/plantbreeding/screens/plant_breeding_tutorial_screen.dart';
import 'package:whatsapp/agrixpert/plantbreeding/screens/plant_detail_screen.dart';
import 'package:whatsapp/agrixpert/plantbreeding/screens/selective_breeding_tutorial_screen.dart';

class PlantCatalogScreen extends StatelessWidget {
  const PlantCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlantBreedingTutorialScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.library_books),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectiveBreedingTutorialScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          itemCount: plants.length,
          itemBuilder: (context, index) {
            final plant = plants[index];
            return PlantCard(plant: plant);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CrossBreedingScreen(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.merge, color: Colors.white),
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantDetailScreen(plant: plant),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: plant.id,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(plant.imageUrl),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                plant.name,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4.0),
              Text(
                plant.category,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 4.0,
                children:
                    plant.traits.entries.map((entry) {
                      return Chip(
                        label: Text(
                          '${entry.key}: ${entry.value}',
                          style: const TextStyle(fontSize: 10),
                        ),
                        backgroundColor: Colors.green.shade100,
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
