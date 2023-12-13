import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'google_sign_in_null_account_error.dart';

class AuthenticationRepository {
  Future<UserCredential> signIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? account = await googleSignIn.signIn();

    if (account == null) throw GoogleSignInNullAccountError();

    GoogleSignInAuthentication authentication = await account.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken);

    return _auth.signInWithCredential(credential);
  }

  FirebaseAuth get _auth => FirebaseAuth.instance;

  Future<UserCredential> signInAnonymous() async {
    UserCredential result = await _auth.signInAnonymously();
    return result;
  }

  Future signOut() async {
    await GoogleSignIn().signOut();
    return await _auth.signOut();
  }

  bool isSignedIn() => _auth.currentUser != null;

  User? get user {
    return _auth.currentUser;
  }

  String? get uid => user?.uid;

  User? get nonAnonymousUser {
    return user?.isAnonymous == false ? user : null;
  }

  bool isAnonymous() => user?.isAnonymous == true;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Stream<User?> idTokenChanges() => _auth.idTokenChanges();

  Stream<User?> userChanges() => _auth.userChanges();
}
