// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider(
  (ref) => AuthService(
    auth: FirebaseAuth.instance,
    googleSignIn: GoogleSignIn(),
  ),
);

class AuthService {
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;
  AuthService({
    required this.auth,
    required this.googleSignIn,
  });

  signInWithGoogle() async {
    final user = await googleSignIn.signIn();
    final googleAuth = await user!.authentication;
    final credencial = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await auth.signInWithCredential(credencial);
  }
}
