import 'package:ballastlane_flutter/providers/auth_provider.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Initial auth state should be unauthenticated', () {
    final authProvider = AuthProvider();
    expect(authProvider.isAuthenticated, false);

  });
}
