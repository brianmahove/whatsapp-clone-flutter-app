import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/theme/theme_provider.dart';

class ChatsSettingsScreen extends StatelessWidget {
  const ChatsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        children: [
          _buildThemeSection(context),
          _buildListItem(
            context,
            title: 'Default chat theme',
            onTap: () {
              // Handle Default chat theme
            },
          ),
          _buildListItem(context, title: 'Enter is send', hasSwitch: true),
          _buildListItem(
            context,
            title: 'Keep chats archived',
            subtitle:
                'Archived chats will remain archived when you receive a new message',
            hasSwitch: true,
          ),
          _buildListItem(
            context,
            title: 'Chat backup',
            onTap: () {
              // Handle Chat backup
            },
          ),
          _buildListItem(
            context,
            title: 'Transfer chats',
            onTap: () {
              // Handle Transfer chats
            },
          ),
          _buildListItem(
            context,
            title: 'Chat history',
            onTap: () {
              // Handle Chat history
            },
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    String themeText = 'System default';

    switch (themeProvider.themeMode) {
      case ThemeMode.light:
        themeText = 'Light';
        break;
      case ThemeMode.dark:
        themeText = 'Dark';
        break;
      case ThemeMode.system:
        themeText = 'System default';
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Display',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _showThemeDialog(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Theme', style: TextStyle(fontSize: 18)),
                  Text(
                    themeText,
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showThemeDialog(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    ThemeMode currentMode = themeProvider.themeMode;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose theme'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildRadioListTile(
                    context,
                    title: 'System default',
                    value: ThemeMode.system,
                    groupValue: currentMode,
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.setThemeMode(value);
                        setState(() => currentMode = value);
                      }
                    },
                  ),
                  _buildRadioListTile(
                    context,
                    title: 'Light',
                    value: ThemeMode.light,
                    groupValue: currentMode,
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.setThemeMode(value);
                        setState(() => currentMode = value);
                      }
                    },
                  ),
                  _buildRadioListTile(
                    context,
                    title: 'Dark',
                    value: ThemeMode.dark,
                    groupValue: currentMode,
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.setThemeMode(value);
                        setState(() => currentMode = value);
                      }
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRadioListTile(
    BuildContext context, {
    required String title,
    required ThemeMode value,
    required ThemeMode groupValue,
    void Function(ThemeMode?)? onChanged,
  }) {
    return RadioListTile<ThemeMode>(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    bool hasSwitch = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
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
            if (hasSwitch)
              Switch(
                value: false, // Replace with actual state if needed
                onChanged: (value) {
                  // Handle toggle
                },
              ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}
