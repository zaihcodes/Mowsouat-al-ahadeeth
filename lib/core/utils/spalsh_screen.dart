import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeeth/src/category/presentation/blocs/category/category_bloc.dart';
import 'package:hadeeth/src/category/presentation/screens/categories_screen.dart';
import 'package:hadeeth/core/dependecies/injection_container.dart' as di;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Add a delay to simulate loading time
    Future.delayed(const Duration(seconds: 2), () {
      context.read<CategoryBloc>().add(GetAllCategories(lang: 'ar'));
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      // );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      );
    });
    return Scaffold(
      backgroundColor: Theme.of(context)
          .colorScheme
          .secondaryContainer, // Set your desired background color
      body: Center(
        child: Image.asset(
          'assets/images/hadeeth_logo.png', // Replace with your logo image path
          width: 200, // Adjust the width as needed
          height: 200, // Adjust the height as needed
        ),
      ),
    );
  }
}
