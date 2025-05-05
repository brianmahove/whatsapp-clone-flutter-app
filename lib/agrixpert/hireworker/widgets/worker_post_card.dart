import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/hireworker/models/work_post.dart';

class WorkerPostCard extends StatelessWidget {
  final WorkerPost worker;

  const WorkerPostCard({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              worker.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Skills: ${worker.skills.join(', ')}'),
            Text('Availability: ${worker.availability}'),
            Text('Location: ${worker.location}'),
            Text('Rate: ${worker.rate}'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Implement "Rent this worker" logic here (in a real app)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Contact ${worker.name} (not implemented in this demo)',
                    ),
                  ),
                );
              },
              child: const Text('Contact Worker'),
            ),
          ],
        ),
      ),
    );
  }
}
