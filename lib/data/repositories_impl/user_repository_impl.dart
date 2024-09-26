import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/firebase_auth_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuthRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<AppUser?> signUp(String name, String email, String password) {
    return remoteDataSource.signUp(name, email, password);
  }

  @override
  Future<AppUser?> login(String email, String password) async {
    return await remoteDataSource.login(email, password);
  }
}
