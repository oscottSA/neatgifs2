import 'package:flutter/material.dart';
import 'package:neatgifs2/models/gif_service.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  List<String> results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NeatGifs2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (String value) async {
                List<String> gifUrls = await GifService().searchGifs(value);
                setState(() {
                  results = gifUrls;
                });
              },
            ),
            if (results.isNotEmpty)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  children: results
                      .map((gifUrl) => FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage, image: gifUrl))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
