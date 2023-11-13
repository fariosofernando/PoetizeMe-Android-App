import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poetizeme/api/configs_api.dart';
import 'package:poetizeme/blocs/home/bloc.dart';
import 'package:poetizeme/ui/app_widget.dart';
import 'package:provider/provider.dart';

import 'api/poetry_api.dart';
import 'utils/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox('settings');

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
