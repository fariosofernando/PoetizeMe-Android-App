import 'package:flutter/material.dart';
import 'package:poetizeme/blocs/home/bloc.dart';
import 'package:poetizeme/ui/home/home_page.dart';

import '../utils/system_ui_overlay_style.dart';

class PresplashView extends StatefulWidget {
  final bool preload;
  final HomeBloc? bloc;
  const PresplashView({this.bloc, this.preload = false, super.key});

  @override
  State<PresplashView> createState() => _PresplashViewState();
}

class _PresplashViewState extends State<PresplashView> {
  @override
  void initState() {
    // O preload, é responsavel por garantir que mostre a presplash screen
    // até que tudo esteja pronto para inicializar.
    if (!widget.preload) {
      _navigation();
    }

    super.initState();
  }

  _navigation() async {
    push() {
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return MyHomePage(widget.bloc!, title: "PoetizeMe");
      }), (route) => false);
    }

    await Future.delayed(const Duration(seconds: 5));
    push();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: systemUiOverlayStyle(context),
      ),
      body: const Stack(
        children: [
          FavoriteWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "EXPRESSÃO POÉTICA EM CADA PALAVRA",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "P",
        style: TextStyle(
          fontFamily: 'BirthstoneBounce',
          fontWeight: FontWeight.w500,
          fontSize: 45,
        ),
      ),
    );
  }
}
