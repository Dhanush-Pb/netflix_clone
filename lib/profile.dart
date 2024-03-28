import 'package:flutter/material.dart';

class Mynetflix extends StatefulWidget {
  const Mynetflix({super.key});

  @override
  State<Mynetflix> createState() => _MynetflixState();
}

class _MynetflixState extends State<Mynetflix> {
  // Dummy data for recommended shows/movies
  final List<String> recommendedItems = [
    'Stranger Things',
    'The Crown',
    'Money Heist',
    'The Witcher',
    'Black Mirror',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Netflix'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.menu_rounded),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'lib/asset/netflix-profile-pictures-1000-x-1000-88wkdmjrorckekha.jpg',
                height: 70,
                width: 70,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome to Netflix',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Unlimited entertainment, one low price. '
            ' ',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Stream your favorite shows,movies,',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const Text(
            ' and documentaries Discover thousands of titles,',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const Text(
            'including exclusive content and original series.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 80,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text('Notifications'),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 170,
              ),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 3, 133, 255),
                  child: Icon(
                    Icons.download_sharp,
                    size: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text('Downloads'),
              SizedBox(
                width: 200,
              ),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(
            height: 170,
          ),
          ElevatedButton(
            onPressed: () {
              // Add functionality for sign out
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 40),
                backgroundColor: const Color.fromARGB(255, 7, 156, 255)),
            child: const Text(
              'Create A Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
