import 'package:flutter/material.dart';
import 'package:post_app_flutter/application/core/services/theme_service.dart';
import 'package:post_app_flutter/application/features/posts/post_page.dart';
import 'package:post_app_flutter/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (create) => ThemeServiceProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
      builder: (context, themeService, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          title: 'Post App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: PostWrapper(),
        );
      },
    );
  }
}
