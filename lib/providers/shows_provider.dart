import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowsProvider with ChangeNotifier {
  List<dynamic> _shows = [];
  bool _isLoading = false;

  List<dynamic> get shows => _shows;

  bool get isLoading => _isLoading;
  late http.Client client;

  ShowsProvider({required this.client});

  Future<void> fetchShows(String query) async {
    _isLoading = true;
    notifyListeners();
    final response = await client
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    _shows = json.decode(response.body);
    _isLoading = false;
    notifyListeners();
  }

  Future<Map<String, dynamic>> fetchShowDetails(int id) async {
    final response =
        await client.get(Uri.parse('https://api.tvmaze.com/shows/$id'));
    return json.decode(response.body);
  }


}
