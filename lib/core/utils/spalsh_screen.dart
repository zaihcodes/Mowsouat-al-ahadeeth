import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeeth/core/constants/constants.dart';
import 'package:hadeeth/core/services/storage.dart';
import 'package:hadeeth/src/category/presentation/blocs/category/category_bloc.dart';
import 'package:hadeeth/src/category/presentation/screens/categories_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();

    if (StorageService.getAppFirstOpen()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Add a delay to simulate loading time
    Future.delayed(const Duration(seconds: 2), () {
      context.read<CategoryBloc>().add(GetAllCategories(lang: 'ar'));
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      // );
      StorageService.setAppFirstOpen(true);
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
