import 'package:flutter/material.dart';
import 'package:poetizeme/models/poetry_model.dart';
import 'package:poetizeme/utils/system_ui_overlay_style.dart';

class PoetryPage extends StatelessWidget {
  final PoetryModel model;
  const PoetryPage(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: systemUiOverlayStyle(context),
        title: Text(model.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Gostar"),
          const BottomNavigationBarItem(icon: Icon(Icons.copy), label: "Copiar"),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                child: Text(model.author.username[0].toUpperCase()),
              ),
              label: model.author.username),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                Text(
                  ' "',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[200],
                    height: .1,
                  ),
                ),
              ],
            ),
            Text(
              "       ${model.content}",
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 16,
                // wordSpacing: 10,
                // letterSpacing: 5,
                height: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
