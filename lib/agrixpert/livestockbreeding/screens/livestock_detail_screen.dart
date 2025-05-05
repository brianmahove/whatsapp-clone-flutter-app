import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/livestockbreeding/models/livestock.dart'; // Changed import

class LivestockDetailScreen extends StatelessWidget {
  final Livestock livestock; // Changed class name

  const LivestockDetailScreen({
    super.key,
    required this.livestock,
  }); // Changed constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(livestock.name), // Changed title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: livestock.id,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(livestock.imageUrl),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              livestock.name,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              livestock.species, // Changed to species
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Traits:',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  livestock.traits.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.label_outline,
                            color: Colors.brown,
                          ), // Changed color
                          const SizedBox(width: 8.0),
                          Text(
                            '${entry.key}: ${entry.value}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
