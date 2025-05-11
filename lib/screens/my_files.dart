import 'package:flutter/material.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({super.key});

  @override
  State<MyFiles> createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {
  final List<Map<String, String>> resumes = List.generate(
    3,
        (index) => {
      'name': 'My CV.pdf',
      'path': '/Users/some_moniker_lol/Library/Developer/...',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Row with Back Button and Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back, size: 24),
                  Spacer(),
                  Text(
                    'Resume',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),

            // Resume list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: resumes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      'images/pdf.png', // Replace with your PDF icon path
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      resumes[index]['name']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      resumes[index]['path']!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle upload from link
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text("Upload from Link", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle upload from device
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text("Upload from Device", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
