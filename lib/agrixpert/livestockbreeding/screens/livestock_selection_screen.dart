import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/livestockbreeding/models/livestock.dart'; // Changed import

class LivestockSelectionScreen extends StatelessWidget {
  final String title;
  final Function(Livestock) onLivestockSelected; // Changed type

  const LivestockSelectionScreen({
    super.key,
    required this.title,
    required this.onLivestockSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: livestock.length,
        itemBuilder: (context, index) {
          final animal = livestock[index]; // Changed variable name
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  animal.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.error_outline),
                ),
              ),
            ),
            title: Text(animal.name),
            subtitle: Text(animal.species), // Changed to species
            onTap: () {
              onLivestockSelected(animal); // Changed callback
            },
          );
        },
      ),
    );
  }
}
