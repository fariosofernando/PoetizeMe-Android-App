import 'package:flutter/material.dart';

import '../../utils/system_ui_overlay_style.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(systemOverlayStyle: systemUiOverlayStyle(context)),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
