import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/presentation/provider/theme_provider.dart';
import 'package:news_app/presentation/ui/auth/login_screen.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../provider/auth_provider.dart';
import '../../widgets.dart';

//ec3a741a2ab84d969d95f07133bf6e27
class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                      hintText: 'Name',
                      controller: nameController,
                    ),
                    SizedBox(height: height * 0.02),
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
                  onPressed: () async {
                    await authProvider.signUp(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                    );

                    if (authProvider.errorMessage != null) {
                      String errMessage = authProvider.errorMessage!;
                      Fluttertoast.showToast(
                        msg: authProvider.errorMessage!,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: "Sign Up successfully!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  },
                  child: Text('Sign Up',style: TextStyle(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Already have an account? ',
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Login',
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