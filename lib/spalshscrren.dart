import 'package:flutter/material.dart';
import 'package:netflix/Homepage.dart';
import 'package:netflix/New&Hot.dart';
import 'package:netflix/profile.dart';

// ignore: use_key_in_widget_constructors
class BottomNavPage extends StatefulWidget {
  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  @override
  void initState() {
    NetflixNewAndHotPage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: 'New & Hot',
              ),
              Tab(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    child: Image(
                      image: AssetImage(
                        'lib/asset/netflix-profile-pictures-1000-x-1000-88wkdmjrorckekha.jpg',
                      ),
                      width: 30,
                    ),
                  ),
                ),
                text: 'Mynetflix',
              ),
            ],
            indicatorColor: Color.fromARGB(181, 255, 255, 255),
            labelColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        body: const TabBarView(
            children: [Homepage(), NetflixNewAndHotPage(), Mynetflix()]),
      ),
    );
  }
}
