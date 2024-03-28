import 'package:flutter/material.dart';
import 'package:netflix/Servises/apimodel.dart';

import 'package:netflix/apiservise.dart';
import 'package:netflix/series.dart';
import 'package:netflix/tv.dart';

class NetflixNewAndHotPage extends StatefulWidget {
  const NetflixNewAndHotPage({Key? key}) : super(key: key);

  @override
  State<NetflixNewAndHotPage> createState() => _NetflixNewAndHotPageState();
}

class _NetflixNewAndHotPageState extends State<NetflixNewAndHotPage> {
  late Future<List<Series>> trendidngmovie;
  late Future<List<Movie>> topratedmovie;
  late Future<List<Movie>> upcoming;
  final imageUrl = 'https://image.tmdb.org/t/p/w500';
  int selectedindex = 2;

  @override
  void initState() {
    const NetflixNewAndHotPage();
    topratedmovie = Topratedmovie();
    upcoming = Upcoming();
    trendidngmovie = tvDramas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New & Hot',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold), // Increase the font size
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 36, 36, 36),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildAppBarButton(
                    'Latest', () => _ontapped(0), '🍿', selectedindex == 0),
                _buildAppBarButton(
                    'Tvshows', () => _ontapped(1), '📺', selectedindex == 1),
                _buildAppBarButton(
                    'New&Hot', () => _ontapped(2), '', selectedindex == 2),
                _buildAppBarButton(
                    'Upcoming', () => _ontapped(3), '🔜', selectedindex == 3),
                _buildAppBarButton(
                    'Trending', () => _ontapped(4), '', selectedindex == 4)
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: tvDramas(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      color: Color.fromARGB(0, 0, 0, 0),
                    ); // Show a loading indicator while data is being fetched
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Text(
                        'Error: Unable to fetch data'); // Show an error message if data fetching fails
                  } else {
                    // Rend
                    return ListView.builder(
                      shrinkWrap: true,
                      itemExtent:
                          250, // Setting the extent of each item in the list
                      itemCount: snapshot.data
                          ?.length, // Setting the number of items in the list
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 25, right: 15, left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 220,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        tvdetail(
                                                            MMovie:
                                                                snapshot.data![
                                                                    index])));
                                          },
                                          child: Image.network(
                                            imageUrl +
                                                (snapshot.data![index]
                                                        .coverImage ??
                                                    ''),
                                            fit: BoxFit.cover,
                                            height: double.infinity,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 5,
                                          left: 15,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Text('Release : '),
                                                  Text(
                                                    snapshot.data![index]
                                                        .firstAirDate,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                      Positioned(
                                          bottom: 25,
                                          left: 15,
                                          child: Column(
                                            children: [
                                              Text(
                                                snapshot.data![index].name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          )),
                                      const Positioned(
                                        bottom: 15,
                                        right: 70,
                                        child: Column(
                                          children: [
                                            Icon(Icons.notifications_outlined,
                                                color: Colors.white),
                                            Text(
                                              'Reminder me',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      const Positioned(
                                        bottom: 15,
                                        right: 20,
                                        child: Column(
                                          children: [
                                            Icon(Icons.info_outline_rounded,
                                                color: Colors.white),
                                            Text(
                                              'Info',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarButton(
    String label,
    Function() onPressed,
    String imagePath,
    bool isSelected,
  ) {
    final color = isSelected
        ? const Color.fromARGB(255, 247, 245, 245)
        : const Color.fromARGB(131, 156, 156, 156);
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: color,
        ),
        child: Row(
          children: [
            Text(imagePath),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  void _ontapped(
    int index,
  ) {
    setState(() {
      selectedindex = index;
    });
  }
}
