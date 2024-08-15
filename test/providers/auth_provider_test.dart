import 'package:ballastlane_flutter/providers/auth_provider.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Initial auth state should be unauthenticated', () {
    final authProvider = AuthProvider();
    expect(authProvider.isAuthenticated, false);
  });

  test('Login with correct credentials should autenticate the user', () async {
    final authProvider = AuthProvider();
    await authProvider.login('admin','admin');
    expect(authProvider.isAuthenticated, true);
  });

  test('Login with incorrect credentials should not authenticate user', () async {
    final authProvider = AuthProvider();
    await authProvider.login('user', 'user');
    expect(authProvider.isAuthenticated, false);
  });
}
