import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:netflix/apiservise.dart';
import 'package:netflix/searchclass.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController searchcontroller = TextEditingController();

  List<SearchModel> searchResults = [];
  final imageUrl = 'https://image.tmdb.org/t/p/w500';

  Future<void> search(String query) async {
    final result = await getSearchResults(query);
    setState(() {
      searchResults = result;
    });
  }

  @override
  void dispose() {
    searchcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: CupertinoSearchTextField(
                  padding: const EdgeInsets.all(10),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  controller: searchcontroller,
                  suffixIcon: const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  style: const TextStyle(color: Colors.white),
                  backgroundColor:
                      const Color.fromARGB(255, 190, 190, 190).withOpacity(0.3),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      // Load default movie backdrops when search value is empty
                      setState(() {
                        searchResults = [];
                      });
                    } else {
                      search(value);
                    }
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  height: 700, // Adjust height as needed
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // You can change this value as needed
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                      childAspectRatio: 0.7, // Adjust aspect ratio as needed
                    ),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final result = searchResults[index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: result.movie != null
                                  ? Image.network(
                                      '$imageUrl${result.movie!.posterpath}',
                                      fit: BoxFit.fill)
                                  : Image.network(
                                      '$imageUrl${result.series!.posterImage}',
                                      fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 5),
                              child: Text(
                                result.movie != null
                                    ? result.movie!.title
                                    : result.series!.name,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
