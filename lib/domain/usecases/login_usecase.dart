import '../entities/user.dart';
import '../repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository repository;

  LoginUseCase(this.repository);

  Future<AppUser?> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
