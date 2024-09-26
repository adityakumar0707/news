import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/data/datasources/firebase_auth_remote_data_source.dart';
import 'package:news_app/data/datasources/news_remote_data_source.dart';
import 'package:news_app/data/repositories_impl/news_repository_impl.dart';
import 'package:news_app/data/repositories_impl/user_repository_impl.dart';
import 'package:news_app/domain/usecases/get_news_usecase.dart';
import 'package:news_app/domain/usecases/login_usecase.dart';
import 'package:news_app/domain/usecases/save_user_usecase.dart';
import 'package:news_app/presentation/provider/auth_provider.dart';
import 'package:news_app/presentation/provider/news_provider.dart';
import 'package:news_app/presentation/provider/theme_provider.dart';
import 'package:news_app/presentation/ui/auth/login_screen.dart';
import 'package:news_app/presentation/ui/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCTO8UeTzlA8NcgbiIqvAP5BYuWTzQn9sw',
      appId: '1:316329198067:android:e59742ca2803209cda9286',
      messagingSenderId: '316329198067',
      projectId: 'newsapp-7c52b',
      storageBucket: 'newsapp-7c52b.appspot.com',
    ),
  );

  // Initialize dependencies
  final firebaseAuth = FirebaseAuth.instance;
  final dio = Dio();

  final firebaseAuthRemoteDataSource = FirebaseAuthRemoteDataSource(firebaseAuth);
  final userRepository = UserRepositoryImpl(firebaseAuthRemoteDataSource);
  final saveUserUseCase = SaveUserUseCase(userRepository);
  final loginUseCase = LoginUseCase(userRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // Provide ThemeProvider
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(
            saveUserUseCase,
            loginUseCase,
          ),
        ),
        ChangeNotifierProvider<NewsProvider>(
          create: (context) {
            final http.Client client = http.Client();
            final newsRemoteDataSource = NewsRemoteDataSource(client);
            final newsRepository = NewsRepositoryImpl(newsRemoteDataSource);
            final getNewsUseCase = GetNewsUseCase(newsRepository);
            return NewsProvider(getNewsUseCase);
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<User?>(
        future: _getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }

  Future<User?> _getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}
