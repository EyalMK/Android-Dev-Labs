import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Israel Israeli\'s Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=14',
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Israel Israeli',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Android Developer',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 2),
          Text(
            'Software Engineering BS.c',
            style: TextStyle(fontSize: 12, color: Colors.blueGrey),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.message),
                label: Text('Message'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.call),
                label: Text('Call'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
