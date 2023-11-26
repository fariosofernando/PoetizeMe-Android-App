import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'api/configs_api.dart';
import 'api/poetry_api.dart';
import 'blocs/home/bloc.dart';
import 'color_schemes.g.dart';
import 'splash.dart';
import 'ui/app_widget.dart';
import 'utils/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Animate.restartOnHotReload = true;

  const titleApplication = "PoetizeMe";

  await Hive.initFlutter();
  var box = await Hive.openBox('settings');

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(box),
      child: MaterialApp(
        title: titleApplication,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        themeMode: ThemeNotifier(box).currentThemeMode,
        home: const PresplashView(preload: true),
      ),
    ),
  );

  HomeBloc bloc = HomeBloc(Poetry(APIConfigs()));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(box),
        ),
      ],
      child: MyApp(bloc),
    ),
  );
}
