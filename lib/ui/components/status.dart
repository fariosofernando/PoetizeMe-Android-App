import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  final bool isUpdated;
  const Status({this.isUpdated = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, left: 8),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: isUpdated ? Theme.of(context).colorScheme.primary : Colors.transparent,
        child: const CircleAvatar(
          radius: 25,
        ),
      ),
    );
  }
}
