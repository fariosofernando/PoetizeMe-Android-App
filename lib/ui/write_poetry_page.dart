import 'package:flutter/material.dart';

class WritePoetryPage extends StatefulWidget {
  const WritePoetryPage({Key? key}) : super(key: key);

  @override
  State<WritePoetryPage> createState() => _WritePoetryPageState();
}

class _WritePoetryPageState extends State<WritePoetryPage> {
  TextAlign _textAlign = TextAlign.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _buildDropdown(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_add_outlined)),
          FilledButton(onPressed: () {}, child: const Text("Publicar")),
          const SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          const TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Title",
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlign: _textAlign,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 2,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your poetry...",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton<TextAlign>(
        underline: const SizedBox.shrink(),
        value: _textAlign,
        onChanged: (TextAlign? newValue) {
          if (newValue != null) {
            setState(() {
              _textAlign = newValue;
            });
          }
        },
        items: const [
          DropdownMenuItem<TextAlign>(
            value: TextAlign.left,
            child: Row(
              children: [
                Icon(Icons.format_align_left),
                SizedBox(width: 8),
                Text("Left"),
              ],
            ),
          ),
          DropdownMenuItem<TextAlign>(
            value: TextAlign.center,
            child: Row(
              children: [
                Icon(Icons.format_align_center),
                SizedBox(width: 8),
                Text("Center"),
              ],
            ),
          ),
          DropdownMenuItem<TextAlign>(
            value: TextAlign.right,
            child: Row(
              children: [
                Icon(Icons.format_align_right),
                SizedBox(width: 8),
                Text("Right"),
              ],
            ),
          ),
          DropdownMenuItem<TextAlign>(
            value: TextAlign.justify,
            child: Row(
              children: [
                Icon(Icons.format_align_justify),
                SizedBox(width: 8),
                Text("Justify"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
