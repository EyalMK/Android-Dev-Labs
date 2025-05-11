import 'package:android_lab_exercises/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:android_lab_exercises/components/buttons/service_button.dart';
import 'package:android_lab_exercises/components/screen_app_bar.dart';
import 'package:android_lab_exercises/components/texts/secondary_screen_title.dart';
import 'package:android_lab_exercises/screens/my_profile.dart';
import 'package:android_lab_exercises/screens/my_files.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPageIndex = 0;
  String? selectedService = 'Cleaning';

  final Map<String, String> services = {
    'Cleaning': 'images/cleaning.png',
    'Plumber': 'images/plumber.png',
    'Electrician': 'images/electrician.png',
    'Painter': 'images/painter.png',
    'Carpenter': 'images/carpenter.png',
    'Gardener': 'images/gardening.png',
  };

  List<Widget> buildServiceRows() {
    final List<Widget> rows = [];
    final entries = services.entries.toList();

    for (int i = 0; i < entries.length; i += 2) {
      rows.add(
        Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: ServiceBox(
                imagePath: entries[i].value,
                label: entries[i].key,
                isSelected: selectedService == entries[i].key,
                onTap: () => selectService(entries[i].key),
              ),
            ),
            const SizedBox(width: 8),
            if (i + 1 < entries.length)
              Expanded(
                child: ServiceBox(
                  imagePath: entries[i + 1].value,
                  label: entries[i + 1].key,
                  isSelected: selectedService == entries[i + 1].key,
                  onTap: () => selectService(entries[i + 1].key),
                ),
              )
            else
              const Spacer(),
          ],
        ),
      );
    }

    return rows;
  }

  void selectService(String service) {
    setState(() {
      selectedService = service;
    });
  }

  Widget getCurrentPage() {
    switch (currentPageIndex) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const SecondaryScreenTitle("Which services do you need?"),
              const SizedBox(height: 100),
              ...buildServiceRows(),
            ],
          ),
        );
      case 1:
        return const Settings();
      case 2:
        return const ProfileScreen();
      case 3:
        return const MyFiles();
      default:
        return const Center(child: Text("Unknown tab"));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> pageTitles = ['Dashboard', 'Settings', 'Profile', 'My Files'];

    return Scaffold(
      appBar: ScreenAppBar(pageTitles[currentPageIndex]),
      body: getCurrentPage(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(Icons.folder),
            label: 'My Files',
          ),
        ],
      ),
    );
  }
}
