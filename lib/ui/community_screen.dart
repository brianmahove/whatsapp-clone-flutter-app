import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Communities'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle menu item selection
            },
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'New community',
                    child: Text('New community'),
                  ),
                  // Add other community menu items if any
                ],
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.groups,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.green,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
              title: const Text('New community'),
              onTap: () {
                // Implement navigation to create a new community
              },
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                top: 16.0,
                bottom: 8.0,
                right: 16.0,
              ),
              child: Divider(),
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage(
                  'assets/profile.png',
                ), // Placeholder
              ),
              title: const Row(
                children: [
                  Text('Vizion'),
                  SizedBox(width: 4.0),
                  Icon(Icons.circle, size: 8.0, color: Colors.grey),
                  SizedBox(width: 4.0),
                  Text('Community Group 8'),
                  // Add emoji rendering if needed
                  Expanded(
                    child: Text(' 🥳🥳🥳...', overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              onTap: () {
                // Implement navigation to the community
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.volume_up,
                size: 30.0,
                color: Colors.green,
              ),
              title: const Text('Announcements'),
              subtitle: const Text('~Brian: ➡️ Happy Easter clients 🥳'),
              trailing: const Text(
                '4/21/25', // Assuming the date is static for UI
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              onTap: () {
                // Implement navigation to announcements
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage(
                  'assets/profile.png',
                ), // Placeholder
              ),
              title: const Text('Vizion Group 27'),
              subtitle: const Text(
                '+263 77 *** **** joined from the community',
              ),
              trailing: const Text(
                'Yesterday',
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              onTap: () {
                // Implement navigation to the group
              },
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
                  SizedBox(width: 8.0),
                  Text('View all', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
