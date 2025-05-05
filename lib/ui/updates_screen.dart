import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text('Updates'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
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
                      PopupMenuItem<String>(
                        value: 'Status privacy',
                        child: Text('Status privacy'),
                      ),
                      PopupMenuItem<String>(
                        value: 'Settings',
                        child: Text('Settings'),
                      ),
                    ],
                icon: Icon(Icons.more_vert),
              ),
            ],
            bottom: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle 'All' tab selection
                    },
                    child: Text('All', style: TextStyle(color: Colors.grey)),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle 'Status' tab selection
                    },
                    child: Text(
                      'Status',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle 'Channels' tab selection
                    },
                    child: Text(
                      'Channels',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.add,

                          color: Theme.of(context).primaryColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text('My status'),
                subtitle: Text('Tap to add status update'),
                onTap: () {
                  // Implement logic to add a new status
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                child: Text(
                  'Updates',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              _buildStatusItem(
                name: 'bryn',
                time: '4:13 PM',
                imageUrl: 'assets/profile.png', // Placeholder
                hasSeen: true,
              ),
              _buildStatusItem(
                name: 'brynna',
                time: '1:16 PM',
                imageUrl: 'assets/profile.png', // Placeholder
                hasSeen: true,
              ),
              _buildStatusItem(
                name: 'CS',
                time: '12:07 PM',
                imageUrl: 'assets/profile.png', // Placeholder
                hasSeen: true,
              ),
              _buildStatusItem(
                name: 'Takufzwa',
                time: '11:56 AM',
                imageUrl: 'assets/profile.png', // Placeholder
                hasSeen: true,
              ),
              _buildStatusItem(
                name: 'Contact #5241',
                time: '1:28 AM',
                imageUrl: 'assets/profile.png', // Placeholder
                hasSeen: true,
              ),
              _buildStatusItem(
                name: 'John Doe',
                time: 'Yesterday',
                imageUrl: 'assets/profile.png', // Placeholder
                hasSeen: true,
              ),
              _buildStatusItem(
                name: 'Mahove',
                time: 'Yesterday',
                imageUrl: 'assets/profile.png', // Placeholder
                hasSeen: true,
              ),

              // You can add more muted updates here if needed
            ]),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            onPressed: () {
              // Implement logic to edit a status update
            },
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.edit, color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              // Implement logic to open the camera for a new status
            },
            backgroundColor: Colors.green,
            child: Icon(
              Icons.camera_alt,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem({
    required String name,
    required String time,
    required String imageUrl,
    bool hasSeen = false,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      subtitle: Text(time),
      onTap: () {
        // Implement logic to view the status
      },
    );
  }
}
