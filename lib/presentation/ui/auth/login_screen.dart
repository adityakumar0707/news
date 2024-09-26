import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/presentation/provider/theme_provider.dart';
import 'package:news_app/presentation/ui/auth/signup_screen.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../provider/auth_provider.dart';
import '../../widgets.dart';
import '../home/home_screen.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeProvider.isDarkMode() ? AppColors.darkBackgroundColor : AppColors.lightBorderColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'MyNews',
                    style: AppTextStyles.lightBold.copyWith(
                      color: themeProvider.isDarkMode() ? AppColors.darkPrimaryColor : AppColors.lightPrimaryColor,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    authProvider.login(
                      emailController.text,
                      passwordController.text,
                    );
                    if (authProvider.errorMessage == null) {
                      Fluttertoast.showToast(
                        msg: "Login successful!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {

                      String errMessage = authProvider.errorMessage!;

                      if (errMessage.contains('[') && errMessage.contains(']')) {
                        int closingBracketIndex = errMessage.indexOf(']') + 1;
                        errMessage = errMessage.substring(closingBracketIndex).trim();
                      }
                      Fluttertoast.showToast(
                        msg: errMessage,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                  },
                  child: Text('Login',style: TextStyle(
                    color: themeProvider.isDarkMode() ? AppColors.darkPrimaryColor : Colors.white,
                  ),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * 0.5, 50),
                    backgroundColor: themeProvider.isDarkMode() ? AppColors.darkPrimaryColor : AppColors.lightPrimaryColor,

                  ),
                ),
              ),
              SizedBox(height: height*0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        'New here? ',
                        style: TextStyle(
                          color: themeProvider.isDarkMode() ? AppColors.darkPrimaryColor : Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: themeProvider.isDarkMode() ? AppColors.darkPrimaryColor : AppColors.lightPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}