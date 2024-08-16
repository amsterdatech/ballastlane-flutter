import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowsProvider with ChangeNotifier {
  List<dynamic> _shows = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<dynamic> get shows => _shows;

  bool get isLoading => _isLoading;

  String get errorMessage => _errorMessage;

  late http.Client client;

  ShowsProvider({required this.client});

  Future<void> fetchShows(String query) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await client
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _shows = data['shows'];
      } else {
        _shows = [];
        _errorMessage = 'Error fetching shows: ${response.reasonPhrase}';
      }
    } catch (error) {
      _errorMessage = 'Failed to load shows: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> fetchShowDetails(int id) async {
    final response =
        await client.get(Uri.parse('https://api.tvmaze.com/shows/$id'));
    return json.decode(response.body);
  }
}
