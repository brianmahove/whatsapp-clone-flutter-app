import 'package:flutter/material.dart';
import 'package:whatsapp/agrixpert/hireworker/models/work_post.dart';

class WorkPostCard extends StatelessWidget {
  final WorkPost post;

  const WorkPostCard({super.key, required this.post});

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
              post.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(post.description),
            const SizedBox(height: 8),
            Text('Location: ${post.location}'),
            Text('Payment: ${post.payment}'),
            Text('Task: ${post.taskType}'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Implement "Rent a Worker" logic here (in a real app)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Rent this worker (not implemented in this demo)',
                    ),
                  ),
                );
              },
              child: const Text('Rent Worker'),
            ),
          ],
        ),
      ),
    );
  }
}
