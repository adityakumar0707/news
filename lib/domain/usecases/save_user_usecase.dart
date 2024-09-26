import '../repositories/user_repository.dart';
import '../entities/user.dart';

class SaveUserUseCase {
  final UserRepository repository;

  SaveUserUseCase(this.repository);

  Future<AppUser?> call(String name, String email, String password) {
    return repository.signUp(name, email, password);
  }
}
