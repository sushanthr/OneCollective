import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<GoogleSignInAccount?> getSignedInAccount(
    GoogleSignIn googleSignIn) async {
  GoogleSignInAccount? account = googleSignIn.currentUser;
  account ??= await googleSignIn.signInSilently();
  return account;
}

Future<User?> signIntoFirebase(GoogleSignInAccount googleSignInAccount) async {
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleSignInAccount.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final user_credentials =
      await FirebaseAuth.instance.signInWithCredential(credential);
  return user_credentials.user;
}
