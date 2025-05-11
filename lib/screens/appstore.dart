import 'package:flutter/material.dart';
import 'package:android_lab_exercises/components/screen_app_bar.dart';
import 'package:android_lab_exercises/components/texts/secondary_screen_title.dart';

enum AppStatus { get, downloading, open }

class AppStore extends StatefulWidget {
  const AppStore({super.key});

  @override
  State<AppStore> createState() => _AppStoreState();
}

class _AppStoreState extends State<AppStore> {
  final List<Map<String, dynamic>> apps = List.generate(6, (index) {
    return {
      'name': 'App ${index + 1}',
      'description': 'Lorem ipsum ...',
      'status': AppStatus.get,
    };
  });

  void _simulateDownload(int index) {
    setState(() {
      apps[index]['status'] = AppStatus.downloading;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        apps[index]['status'] = AppStatus.open;
      });
    });
  }

  List<Widget> buildAppRows() {
    return List.generate(apps.length, (index) {
      final app = apps[index];
      final AppStatus status = app['status'];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Colors.red, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(Icons.ac_unit, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app['name'],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      app['description'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _buildStatusButton(status, index),
              const SizedBox(width: 8),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildStatusButton(AppStatus status, int index) {
    switch (status) {
      case AppStatus.get:
        return GestureDetector(
          onTap: () => _simulateDownload(index),
          child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'GET',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      case AppStatus.downloading:
        return const SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: Colors.blue,
          ),
        );
      case AppStatus.open:
        return Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              'OPEN',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Apps", color: Colors.blue),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const SecondaryScreenTitle("Sponsored Applications"),
            const SizedBox(height: 20),
            ...buildAppRows(),
          ],
        ),
      ),
    );
  }
}
