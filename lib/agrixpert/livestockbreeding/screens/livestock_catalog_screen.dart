import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:whatsapp/agrixpert/livestockbreeding/models/livestock.dart';
import 'package:whatsapp/agrixpert/livestockbreeding/screens/breeding_tutorial_screen.dart';
import 'package:whatsapp/agrixpert/livestockbreeding/screens/livestock_breeding_screen.dart';
import 'package:whatsapp/agrixpert/livestockbreeding/screens/livestock_detail_screen.dart';

class LivestockCatalogScreen extends StatelessWidget {
  const LivestockCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livestock Catalog'), // Changed title
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BreedingTutorialScreen(),
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
          itemCount: livestock.length,
          itemBuilder: (context, index) {
            final animal = livestock[index]; // Changed variable name
            return LivestockCard(livestock: animal); // Changed widget name
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LivestockBreedingScreen(),
            ), // Changed screen
          );
        },
        backgroundColor: Colors.brown, // Changed color
        child: const Icon(Icons.merge, color: Colors.white),
      ),
    );
  }
}

class LivestockCard extends StatelessWidget {
  final Livestock livestock; // Changed class name

  const LivestockCard({
    super.key,
    required this.livestock,
  }); // Changed constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LivestockDetailScreen(livestock: livestock),
          ), // Changed screen
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: livestock.id,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(livestock.imageUrl),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                livestock.name,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4.0),
              Text(
                livestock.species, // Changed to species
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 4.0,
                children:
                    livestock.traits.entries.map((entry) {
                      return Chip(
                        label: Text(
                          '${entry.key}: ${entry.value}',
                          style: const TextStyle(fontSize: 10),
                        ),
                        backgroundColor: Colors.brown.shade100, // Changed color
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
