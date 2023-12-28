import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadeeth/core/dependecies/injection_container.dart' as di;
import 'package:hadeeth/core/theme/app_theme.dart';
import 'package:hadeeth/src/category/presentation/blocs/category/category_bloc.dart';
import 'package:hadeeth/src/category/presentation/blocs/category_detail/category_detail_bloc.dart';
import 'package:hadeeth/src/category/presentation/screens/categories_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di.sl<CategoryBloc>()..add(GetAllCategories(lang: 'ar')),
        ),
        BlocProvider(
          create: (context) => di.sl<CategoryDetailBloc>(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        home: const CategoriesScreen(),
      ),
    );
  }
}
