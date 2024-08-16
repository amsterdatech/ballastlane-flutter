import 'package:ballastlane_flutter/providers/shows_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ShowsProvider>(context, listen: false).fetchShows("Pokemon");

    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for shows',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Provider.of<ShowsProvider>(context, listen: false)
                        .fetchShows(_searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ShowsProvider>(
              builder: (context, tvProvider, child) {
                if (tvProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (tvProvider.shows.isEmpty) {
                  return const Center(child: Text('No shows found.'));
                }

                return ListView.builder(
                  itemCount: tvProvider.shows.length,
                  itemBuilder: (context, index) {
                    final show = tvProvider.shows[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: ListTile(
                        leading: show['show']['image'] != null
                            ? Image.network(show['show']['image']['medium'])
                            : null,
                        title: Text(show['show']['name']),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(id: show['show']['id']),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
