import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/home/bloc.dart';
import '../color_schemes.g.dart';
import '../utils/theme_notifier.dart';
import 'home/home.dart';

class MyApp extends StatelessWidget {
  final HomeBloc bloc;
  const MyApp(this.bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: themeNotifier.currentThemeMode,
      title: 'PoetizMe',
      home: MyHomePage(bloc, title: 'PoetizeMe'),
    );
  }
}
