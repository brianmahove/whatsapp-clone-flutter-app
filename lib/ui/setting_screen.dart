import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        children: [
          _buildHeader(context),
          _buildListItem(
            context,
            title: 'Account',
            subtitle: 'Security notifications, change number',
            icon: Icons.key,
          ),
          _buildListItem(
            context,
            title: 'Privacy',
            subtitle: 'Block contacts, disappearing messages',
            icon: Icons.lock,
          ),
          _buildListItem(
            context,
            title: 'Avatar',
            subtitle: 'Create, edit, profile photo',
            icon: Icons.person_outline,
          ),
          _buildListItem(
            context,
            title: 'Lists',
            subtitle: 'Manage people and groups',
            icon: Icons.groups_outlined,
          ),
          _buildListItem(
            context,
            title: 'Chats',
            subtitle: 'Theme, wallpapers, chat history',
            icon: Icons.chat_bubble_outline,
          ),
          _buildListItem(
            context,
            title: 'Notifications',
            subtitle: 'Message, group & call tones',
            icon: Icons.notifications_outlined,
          ),
          _buildListItem(
            context,
            title: 'Storage and data',
            subtitle: 'Network usage, auto-download',
            icon: Icons.storage_outlined,
          ),
          _buildListItem(
            context,
            title: 'App language',
            subtitle: "English (device's language)",
            icon: Icons.language,
          ),
          _buildListItem(
            context,
            title: 'Help',
            subtitle: 'Help center, contact us, privacy policy',
            icon: Icons.help_outline,
          ),
          _buildListItem(
            context,
            title: 'Invite a friend',
            icon: Icons.person_add_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300], // Placeholder
            child: const Icon(
              Icons.person,
              size: 36,
              color: Colors.grey,
            ), // Placeholder
          ),
          const SizedBox(width: 16),
          const Text(
            'Begin with GOD', //  Replace with actual name
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.qr_code, color: Colors.grey),
            onPressed: () {
              //  Handle QR code
            },
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.grey),
            onPressed: () {
              // Handle add
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    required String title,
    String? subtitle,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        //  Handle item tap.
        print('Tapped on $title');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey[600], size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18)),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
