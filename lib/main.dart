import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poetizeme/api/configs_api.dart';
import 'package:poetizeme/blocs/home/bloc.dart';
import 'package:poetizeme/utils/system_ui_overlay_style.dart';
import 'package:provider/provider.dart';

import 'api/poetry_api.dart';
import 'blocs/home/events.dart';
import 'blocs/home/states.dart';
import 'color_schemes.g.dart';
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

class MyHomePage extends StatefulWidget {
  final HomeBloc bloc;
  const MyHomePage(this.bloc, {super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final listViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    widget.bloc.inputContent.add(LoadPoetryEvent());
  }

  @override
  void dispose() {
    widget.bloc.inputContent.close();
    _scrollController.dispose();
    super.dispose();
  }

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);

    return StreamBuilder<HomeState>(
        stream: widget.bloc.stream,
        builder: (context, AsyncSnapshot<HomeState> snapshot) {
          final poetryList = snapshot.data?.poetrys ?? [];

          if (snapshot.data is HomeLoadingState) {
            return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: systemUiOverlayStyle(context),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.data is HomeSucessState) {
            return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: systemUiOverlayStyle(context),
                title: Text(widget.title),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isDarkMode = !isDarkMode;
                      });

                      themeNotifier.toggleTheme(ThemeModeSetting.dark.name);
                    },
                    icon: IconButton(
                      onPressed: () {
                        setState(() {
                          isDarkMode = !isDarkMode;
                        });
                      },
                      icon: AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(scale: animation, child: child);
                        },
                        child: isDarkMode
                            ? const Icon(
                                Icons.brightness_2,
                                key: ValueKey('moon'),
                              )
                            : const Icon(
                                Icons.wb_sunny,
                                key: ValueKey('sun'),
                              ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: () => themeNotifier.toggleTheme(ThemeModeSetting.dark.name), icon: const Icon(Icons.menu)),
                ],
              ),
              body: ListView.separated(
                controller: _scrollController,
                key: listViewKey,
                separatorBuilder: (_, __) => const Divider(),
                itemCount: poetryList.length,
                itemBuilder: (context, index) {
                  List<Widget> tagsWidgets = [];
                  for (var element in poetryList[index].tags) {
                    tagsWidgets.add(Card(
                      shadowColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(element.name),
                      ),
                    ));
                  }

                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(poetryList[index].author.username[0].toUpperCase()),
                        ),
                        title: Text(poetryList[index].title),
                        subtitle: Text(
                          poetryList[index].content,
                          textAlign: TextAlign.justify,
                        ),
                        isThreeLine: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${poetryList[index].likes.length} gostos",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Row(children: tagsWidgets),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.copy),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: systemUiOverlayStyle(context),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
