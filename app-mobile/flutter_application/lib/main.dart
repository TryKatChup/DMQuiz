import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dmquiz/model/Settings.dart';
import 'package:dmquiz/views/ViewMenu.dart';

import 'package:dmquiz/model/Themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance().then((prefs) {
    // read from the SharedPreferences
    var isDarkTheme = prefs.getBool("darkTheme") ?? Settings.DEFAULT_DARK_THEME;

    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: const MyApp(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return MaterialApp(
        title: Settings.APP_TITLE,
        themeMode: value.themeMode,
        theme: MyThemes.themeLight,
        darkTheme: MyThemes.themeDark,
        home: const ViewMenu(),
      );
    });
  }
}
