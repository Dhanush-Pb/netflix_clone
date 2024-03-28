import 'package:flutter/material.dart';
import 'package:netflix/Servises/apimodel.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({Key? key, required this.MMovie}) : super(key: key);

  final String imageUrl =
      'https://image.tmdb.org/t/p/w500'; // Base URL for images
  final Movie MMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 37, 37, 37),
              ),
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 16, left: 16),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            expandedHeight: 500,
            backgroundColor: const Color.fromARGB(255, 37, 37, 37),
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '$imageUrl${MMovie.posterpath}',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    '${MMovie.orginaltitle} ',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    'Overview',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    MMovie.overviw,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            const Text('Release date: '),
                            Text(
                              MMovie.relesedate,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            const Text('Rating: '),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${MMovie.voteavrage.toStringAsFixed(1)}/10',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
