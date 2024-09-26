import 'package:flutter/material.dart';
import 'package:news_app/presentation/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputType;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        hintText: hintText,
        hintStyle: TextStyle(
          color: themeProvider.isDarkMode() ? Colors.white : Colors.black,
        ),
        filled: true,
        fillColor: AppColors.lightBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: themeProvider.isDarkMode() ? AppColors.darkBackgroundColor : AppColors.lightBackgroundColor,
          ),
        ),
      ),
    );
  }
}