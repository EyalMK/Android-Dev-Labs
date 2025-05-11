import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notificationsEnabled = true;
  bool darkMode = false;
  bool locationAccess = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text("Enable Notifications"),
          subtitle: const Text("Turn app notifications on or off"),
          value: notificationsEnabled,
          onChanged: (value) {
            setState(() {
              notificationsEnabled = value;
            });
          },
        ),
        const Divider(),
        SwitchListTile(
          title: const Text("Dark Mode"),
          subtitle: const Text("Use a dark theme across the app"),
          value: darkMode,
          onChanged: (value) {
            setState(() {
              darkMode = value;
            });
          },
        ),
        const Divider(),
        SwitchListTile(
          title: const Text("Location Access"),
          subtitle: const Text("Allow the app to access your location"),
          value: locationAccess,
          onChanged: (value) {
            setState(() {
              locationAccess = value;
            });
          },
        ),
      ],
    );
  }
}
