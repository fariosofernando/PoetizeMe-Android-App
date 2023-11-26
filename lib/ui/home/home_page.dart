import 'package:flutter/material.dart';
import 'package:poetizeme/ui/poetry_page.dart';
import 'package:poetizeme/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../blocs/home/bloc.dart';
import '../../blocs/home/events.dart';
import '../../blocs/home/states.dart';
import '../../utils/system_ui_overlay_style.dart';
import '../../utils/theme_notifier.dart';
import '../components/loading_page.dart';
import '../components/status.dart';
import '../my_page.dart';
import '../write_poetry_page.dart';

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

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);

    return StreamBuilder<HomeState>(
        stream: widget.bloc.stream,
        builder: (context, AsyncSnapshot<HomeState> snapshot) {
          final poetryList = snapshot.data?.poetrys ?? [];

          if (snapshot.data is HomeLoadingState) {
            return const LoadingPage();
          } else if (snapshot.data is HomeSucessState) {
            return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: systemUiOverlayStyle(context),
                bottom: PreferredSize(
                  preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Status(isUpdated: true),
                        Status(isUpdated: true),
                        Status(),
                        Status(),
                        Status(),
                        Status(),
                        Status(),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  widget.title[0],
                  style: const TextStyle(
                    fontFamily: 'BirthstoneBounce',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      if ((themeNotifier.currentThemeMode == ThemeMode.dark)) {
                        themeNotifier.toggleTheme(ThemeModeSetting.light.name);
                      } else {
                        themeNotifier.toggleTheme(ThemeModeSetting.dark.name);
                      }
                    },
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: !(themeNotifier.currentThemeMode == ThemeMode.dark)
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
                  _buildPopupMenuButton(),
                  const SizedBox(width: 10),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListView.separated(
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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return PoetryPage(poetryList[index]);
                            }));
                          },
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
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const WritePoetryPage();
                    }),
                  );
                },
                child: const Icon(Icons.history_edu_rounded),
              ),
            );
          }

          return const LoadingPage();
        });
  }

  Widget _buildPopupMenuButton() {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem<String>(
            value: 'profile',
            child: Text('Eu'),
          ),
          PopupMenuItem<String>(
            value: 'settings',
            child: Text('Configurações'),
          ),
        ];
      },
      onSelected: (String value) {
        if (value == 'profile') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Profile();
          }));
        } else if (value == 'settings') {}
      },
      offset: const Offset(0, 50),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(AvatarAssets.golen.asset),
      ),
    );
  }
}
