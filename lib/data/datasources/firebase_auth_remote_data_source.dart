import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user.dart';

class FirebaseAuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRemoteDataSource(this._firebaseAuth);

  Future<AppUser?> signUp(String name, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Create a User object
      return AppUser(uid: userCredential.user!.uid, name: name, email: email);
    } catch (e) {
      throw Exception("Failed to sign up: $e");
    }
  }

  Future<AppUser?> login(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      if (user != null) {
        return AppUser(uid: user.uid, name: user.displayName ?? "", email: user.email!);
      }
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
    return null;
  }
}
