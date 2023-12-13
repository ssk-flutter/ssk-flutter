import 'package:flutter/foundation.dart';

import 'authentication_repository.dart';

class AuthViewModel with ChangeNotifier {

  AuthViewModel(this._auth);

  final AuthenticationRepository _auth;

  bool get isSignedIn => _auth.isSignedIn();

  String get uid => _auth.uid!;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signOut() async {
    try {
      _setLoading(true);
      await _auth.signOut();
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signIn() async {
    try {
      _setLoading(true);
      await _auth.signIn();
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }
}