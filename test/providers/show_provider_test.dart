import 'dart:convert';

import 'package:ballastlane_flutter/providers/shows_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'show_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ShowsProvider showsProvider;
  late MockClient client;

  setUp(() {
    client = MockClient();
    showsProvider = ShowsProvider(client: client);
  });

  test('should set shows correctly from the API response', () async {
    final client = MockClient();
    final mockResponse = jsonEncode({
      "shows": [
        {
          "show": {
            "id": 1,
            "name": "Pokémon",
            "image": {"medium": "https://image.url"}
          }
        }
      ]
    });

    // Use Mockito to return a successful response when it calls the
    // provided http.Client.
    when(client.get(Uri.parse('https://api.tvmaze.com/search/shows?q=pokemon')))
        .thenAnswer((_) async => http.Response(mockResponse, 200));

    await showsProvider.fetchShows('pokemon');

    // Verify the correct API call was made
    verify(client
            .get(Uri.parse('https://api.tvmaze.com/search/shows?q=pokemon')))
        .called(1);

    // Check that shows are set correctly
    expect(showsProvider.shows.length, 1);
    expect(showsProvider.shows[0]['show']['name'], 'Pokémon');
  });
}
