// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:netflix/New&Hot.dart';
import 'package:netflix/Servises/apimodel.dart';
import 'package:netflix/apiservise.dart';
import 'package:netflix/details.dart';
import 'package:netflix/searchscreen.dart';
import 'package:netflix/series.dart';
import 'package:netflix/tv.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Movie>> trendidngmovie;
  late Future<List<Movie>> topratedmovie;
  late Future<List<Movie>> upcoming;
  late Future<List<Series>> tvshows;
  final imageUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    Searchpage();
    const NetflixNewAndHotPage();
    trendidngmovie = Trendingmovie();
    topratedmovie = Topratedmovie();
    upcoming = Upcoming();
    tvshows = tvDramas();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: const Color.fromARGB(106, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 35),
            child: Image.asset(
              'lib/asset/pngegg.png',
              height: 100,
              width: 130,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Searchpage()));
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Trending Movies',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            FutureBuilder<List<Movie>>(
              future: Trendingmovie(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    color: Colors.black,
                  ); // Show a loading indicator while data is being fetched
                } else if (snapshot.hasError || snapshot.data == null) {
                  return const Text(
                      'Error: Unable to fetch data'); // Show an error message if data fetching fails
                } else {
                  // Render your list view or carousel here using snapshot.data
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 290,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 400),
                      viewportFraction: 0.6,
                      pageSnapping: true,
                    ),
                    itemCount: snapshot.data!
                        .length, // Use the length of the data when it's available
                    itemBuilder: (context, index, _) {
                      // Build each item in the carousel using data from snapshot.data
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Detailspage(
                                    MMovie: snapshot.data![index])));
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  imageUrl + snapshot.data![index].posterpath,
                                  height: 280,
                                  width: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(232, 255, 255,
                                          255), // Change color as needed
                                      borderRadius: BorderRadius.circular(
                                          5), // Optional: Adjust border radius
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.play_arrow,
                                            color: Color.fromARGB(
                                                255, 0, 0, 0)), // Icon
                                        SizedBox(
                                            width:
                                                5), // Space between icon and text
                                        Text(
                                          'Play',
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0,
                                                  0)), // Optional: Text color
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 30,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(103, 255, 252,
                                          252), // Change color as needed
                                      borderRadius: BorderRadius.circular(
                                          5), // Optional: Adjust border radius
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.add,
                                            color: Color.fromARGB(
                                                255, 0, 0, 0)), // Icon
                                        SizedBox(
                                            width:
                                                5), // Space between icon and text
                                        Text(
                                          'My List',
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0,
                                                  0)), // Optional: Text color
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ));
                    },
                  );
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Top Rated Movies',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: FutureBuilder(
                future: Topratedmovie(),
                builder: (ctx, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return null;
                      } else if (snapshot.hasError || snapshot.data == null) {
                        return const Text('Error: Unable to fetch data');
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Detailspage(
                                      MMovie: snapshot.data![index])));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageUrl + snapshot.data![index].posterpath,
                                height: 220,
                                width: 150,
                                fit: BoxFit.fitWidth, // Set BoxFit here
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    itemCount: snapshot.data?.length,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Upcoming movies',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: FutureBuilder(
                  future: Upcoming(),
                  builder: (ctx, snapshot) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // ignore: prefer_const_constructors
                            return null;
                          } else if (snapshot.hasError ||
                              snapshot.data == null) {
                            return const Text('Error: Unable to fetch data');
                          } else {
                            return Padding(
                              // ignore: prefer_const_constructors
                              padding: EdgeInsets.all(8.0), // Add padding here
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Detailspage(
                                          MMovie: snapshot.data![index])));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    height: 220,
                                    width: 150,
                                    child: Image.network(
                                      imageUrl +
                                          snapshot.data![index].posterpath,
                                      fit: BoxFit
                                          .cover, // Specify the fit property here
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        });
                  }),
            ),
            const SizedBox(
              height: 32,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('TV shows',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: FutureBuilder<List<Series>>(
                future: tvshows, // Use the tvshows Future here
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return const Text('Error: Unable to fetch TV show data',
                        style: TextStyle(color: Colors.white));
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      tvdetail(MMovie: snapshot.data![index])));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                child: Image.network(
                                  imageUrl +
                                      (snapshot.data![index].posterImage ?? ''),
                                  height: 220,
                                  width: 150,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
