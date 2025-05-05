import 'package:flutter/material.dart';
import 'package:whatsapp/ui/camera_screen.dart';
import 'package:whatsapp/ui/chat_settings_screen.dart';
import 'package:whatsapp/ui/select_contact_screen.dart';

class ChatListScreen extends StatelessWidget {
  final List<Chat> _chats = [
    Chat(
      name: 'Brian',
      message: ' A collection of textile samples lay spread out on the table',
      time: '4:52 PM',
      avatar: 'B',
      unreadCount: 1,
    ),
    Chat(
      name: 'IT Opportunities',
      message: '-TerrieCK : is there anyone here who did an MPhil ?',
      time: '4:50 PM',
      avatar: 'IT',
      unreadCount: 24,
    ),
    Chat(
      name: 'Computer Science',
      message: '- JD : Men are asymptomatic for a lot of ...',
      time: '4:08 PM',
      avatar: 'CS',
      unreadCount: 4,
    ),
    Chat(
      name: 'SC OFFICIAL ONLINE',
      message: '-bryn .: Thank you mum you have guide my care ...',
      time: '3:15 PM',
      avatar: 'SO',
      unreadCount: 3,
    ),
    Chat(
      name: 'SellQuick',
      message: '+263 7** **** joined using this group\'s invite link',
      time: '4:00 PM',
      avatar: 'SF',
      unreadCount: 17,
    ),
    Chat(
      name: 'Succue',
      message: 'thanks',
      time: '1:37 PM',
      avatar: 'S',
      unreadCount: 0,
    ),
    Chat(
      name: 'AI Group',
      message: 'noted',
      time: '12:28 PM',
      avatar: 'MM',
      unreadCount: 0,
    ),
  ];

  ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              // Implement camera functionality (navigation to CameraScreen)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraScreen(),
                ), // Create CameraScreen
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle menu item selection
              switch (result) {
                case 'New group':
                  // Navigate to new group screen
                  break;
                case 'New community':
                  // Navigate to new community screen
                  break;
                case 'New broadcast':
                  // Navigate to new broadcast screen
                  break;
                case 'Linked devices':
                  // Navigate to linked devices screen
                  break;
                case 'Starred messages':
                  // Navigate to starred messages screen
                  break;
                case 'Settings':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatsSettingsScreen(),
                    ),
                  );
                  // Navigate to settings screen
                  break;
              }
            },
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'New group',
                    child: Text('New group'),
                  ),
                  PopupMenuItem<String>(
                    value: 'New community',
                    child: Text('New community'),
                  ),
                  PopupMenuItem<String>(
                    value: 'New broadcast',
                    child: Text('New broadcast'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Linked devices',
                    child: Text('Linked devices'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Starred messages',
                    child: Text('Starred messages'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Settings',
                    child: Text('Settings'),
                  ),
                ],
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Unread 8',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Favorites 1',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Groups 7',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.green),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectContactScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          final chat = _chats[index];
          return ChatListItem(chat: chat); // Use the new widget here
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle new chat
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectContactScreen()),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.message, color: Theme.of(context).primaryColor),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final Chat chat;

  const ChatListItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualChatScreen(chat: chat),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 25,
              child: Text(
                chat.avatar,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    chat.message,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                if (chat.unreadCount > 0) ...[
                  SizedBox(height: 4.0),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 2.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF25D366), // WhatsApp accent color
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IndividualChatScreen extends StatelessWidget {
  final Chat chat;

  const IndividualChatScreen({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          // or whatever matches your theme
          elevation: 0,
          automaticallyImplyLeading: true, // if you don't want the back button
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 50, right: 16, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 20,
                      child: Text(
                        chat.avatar,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'online',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: _buildMessageList()),
            _buildInputArea(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    //  Replace this with a ListView.builder to display actual messages
    return ListView(
      children: [
        _buildMessageItem(
          text:
              'Hey, hope you had a safe journey! Looking forward to seeing you again.',
          isMe: false,
          time: '9:49 PM',
        ),

        _buildMessageItem(
          text: 'I arrived safely. Thanks for the ride.',
          isMe: true,
          time: '9:51 PM',
        ),
        _buildMessageItem(
          text: 'Hi. I forgot my laptop.',
          isMe: false,
          time: '9:55 PM',
        ),
        _buildMessageItem(
          text: 'I will bring it',
          isMe: false,
          time: '9:56 PM',
        ),
        _buildMessageItem(
          text: 'Thank God it was a long journey. That\'s great soon.',
          isMe: false,
          time: '9:57 PM',
        ),
        _buildMessageItem(
          text: 'Yes Brian. I know it\'s u. Only the name.',
          isMe: true,
          time: '11:03 PM',
        ),
        _buildMessageItem(text: 'Alright.', isMe: false, time: '12:55 AM'),
      ],
    );
  }

  Widget _buildMessageItem({
    required String text,
    required bool isMe,
    required String time,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color:
                    isMe
                        ? Color.fromARGB(255, 21, 20, 20)
                        : Color.fromARGB(255, 33, 33, 33), //  Message color
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1), //  shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(text, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25.0), // Rounded input
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2), // Input shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Message',
                    border: InputBorder.none,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.attach_file,
                            color: Colors.grey[600],
                          ),
                          onPressed: () {
                            // Handle attachment
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt, color: Colors.grey[600]),
                          onPressed: () {
                            // Handle camera
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          CircleAvatar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            radius: 25,
            child: IconButton(
              icon: Icon(Icons.mic, color: Theme.of(context).primaryColor),
              onPressed: () {
                // Handle voice message
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Chat {
  final String name;
  final String message;
  final String time;
  final String avatar;
  final int unreadCount;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    required this.unreadCount,
  });
}
