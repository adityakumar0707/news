import 'package:flutter/material.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/save_user_usecase.dart';
import '../../domain/entities/user.dart';

class AuthenticationProvider with ChangeNotifier {
  final SaveUserUseCase saveUserUseCase;
  final LoginUseCase loginUseCase;

  AuthenticationProvider(this.saveUserUseCase, this.loginUseCase);

  AppUser? _user;
  String? _errorMessage;

  AppUser? get user => _user;
  String? get errorMessage => _errorMessage;

  Future<void> signUp(String name, String email, String password) async {
    try {
      _user = await saveUserUseCase.call(name, email, password);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }


  Future<void> login(String email, String password) async {
    try {
      _user = await loginUseCase.call(email, password);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }


}
