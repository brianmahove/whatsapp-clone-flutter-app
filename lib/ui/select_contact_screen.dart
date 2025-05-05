import 'package:flutter/material.dart';

class SelectContactScreen extends StatelessWidget {
  const SelectContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select contact'),
            Text(
              '271 contacts', // Replace with dynamic contact count
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Implement menu functionality
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.group_add,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            title: const Text('New group'),
            onTap: () {
              // Implement navigation to create a new group
            },
          ),
          ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.person_add,
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
                      Icons.qr_code,
                      color: Colors.grey,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text('New contact'),
            trailing: const Icon(Icons.qr_code, color: Colors.grey),
            onTap: () {
              // Implement navigation to add a new contact
            },
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.green,
              child: Icon(Icons.groups, color: Theme.of(context).primaryColor),
            ),
            title: const Text('New community'),
            onTap: () {
              // Implement navigation to create a new community
            },
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.green,
              child: Icon(Icons.android, color: Theme.of(context).primaryColor),
            ),
            title: const Text('Chat with AIs'),
            onTap: () {
              // Implement navigation to chat with AIs
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Text(
              'Contacts on WhatsApp',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          _buildContactListItem(
            name: 'Hobsta (You)',
            status: 'Message yourself',
            isYou: true,
          ),
          _buildContactListItem(name: 'Ajay', status: 'Busy'),
          _buildContactListItem(
            name: 'Bryn',
            status: 'Hello: I\'m using WhatsApp Business.',
          ),
          _buildContactListItem(name: 'Bridget'),
          _buildContactListItem(
            name: 'Brynna',
            status: 'Vizion Fuzion',
            hasAvatar: true,
            avatarUrl: 'assets/profile.png',
          ),
          _buildContactListItem(name: 'Vizion'),
          _buildContactListItem(name: 'Brian'),
          _buildContactListItem(
            name: 'Tech on Demand',
            status: 'Hey there! I am using WhatsApp.',
          ),
          // Add more contact list items here
        ],
      ),
    );
  }

  Widget _buildContactListItem({
    required String name,
    String? status,
    bool isYou = false,
    bool hasAvatar = false,
    String? avatarUrl,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.grey[300],
        backgroundImage:
            hasAvatar && avatarUrl != null ? NetworkImage(avatarUrl) : null,
        child:
            !hasAvatar
                ? Text(name[0].toUpperCase())
                : null, // Display first letter if no avatar
      ),
      title: Text(name),
      subtitle:
          status != null
              ? Text(status, style: const TextStyle(color: Colors.grey))
              : null,
      onTap: () {
        // Implement navigation to the chat screen with this contact
      },
    );
  }
}
