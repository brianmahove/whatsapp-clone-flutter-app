import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calls'),
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
                    value: 'Clear call log',
                    child: Text('Clear call log'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Settings',
                    child: Text('Settings'),
                  ),
                ],
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorites',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('More', style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage('assets/profile.png'), // Placeholder
            ),
            title: const Text('Mom'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () {
                    // Implement audio call functionality
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.videocam),
                  onPressed: () {
                    // Implement video call functionality
                  },
                ),
              ],
            ),
            onTap: () {
              // Implement tap action for Mom
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Text(
              'Recent',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _buildCallLogItem(
            name: 'Mahove',
            date: 'Today, 11:58 AM',
            icon: Icons.call,
            isOutgoing: false,
          ),
          _buildCallLogItem(
            name: 'Brian',
            date: 'Yesterday, 9:38 PM',
            icon: Icons.call,
            isOutgoing: true,
          ),
          _buildCallLogItem(
            name: 'Brian',
            date: 'Yesterday, 9:37 PM',
            icon: Icons.videocam,
            isOutgoing: false,
          ),
          _buildCallLogItem(
            name: 'Brian',
            date: 'Yesterday, 9:36 PM',
            icon: Icons.call,
            isOutgoing: true,
          ),
          _buildCallLogItem(
            name: 'Shelton Nyatsanza (2)',
            date: 'Yesterday, 7:13 PM',
            icon: Icons.videocam,
            isOutgoing: false,
          ),

          _buildCallLogItem(
            name: 'Contact #5241',
            date: 'April 21, 6:50 PM',
            icon: Icons.videocam,
            isOutgoing: false,
          ),
          _buildCallLogItem(
            name: 'Contact #5241',
            date: 'April 21, 6:47 PM',
            icon: Icons.call,
            isOutgoing: true,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement logic to start a new call
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add_call, color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _buildCallLogItem({
    required String name,
    required String date,
    required IconData icon,
    required bool isOutgoing,
  }) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25.0,
        backgroundImage: AssetImage('assets/profile.png'), // Placeholder
      ),
      title: Text(name),
      subtitle: Row(
        children: [
          Icon(
            isOutgoing ? Icons.arrow_outward : Icons.arrow_downward,
            size: 16.0,
            color: Colors.green,
          ),
          const SizedBox(width: 4.0),
          Text(date),
        ],
      ),
      trailing: Icon(icon),
      onTap: () {
        // Implement tap action for call log item
      },
    );
  }
}
