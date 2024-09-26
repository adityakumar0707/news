import '../entities/user.dart';

abstract class UserRepository {
  Future<AppUser?> login(String email, String password);
  Future<AppUser?> signUp(String name, String email, String password);
}

