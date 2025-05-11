import 'package:flutter/material.dart';
import 'package:android_lab_exercises/components/buttons/service_button.dart';
import 'package:android_lab_exercises/components/screen_app_bar.dart';
import 'package:android_lab_exercises/components/texts/secondary_screen_title.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              const Spacer(), // Fills space if last row has only one box
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Dashboard"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const SecondaryScreenTitle("Which services do you need?"),
            const SizedBox(height: 100),
            ...buildServiceRows(),
          ],
        ),
      ),
    );
  }
}