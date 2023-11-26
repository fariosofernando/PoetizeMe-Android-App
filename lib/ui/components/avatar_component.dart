import 'package:flutter/material.dart';

import '../../utils/utils.dart';

typedef AvatarAction = Function();

class Avatar extends StatelessWidget {
  final bool addNewPhotoProfile;
  final AvatarAction onTap;
  final double height, width;
  final AvatarAssets avatar;
  final bool border;

  const Avatar({this.border = false, this.addNewPhotoProfile = false, required this.onTap, required this.avatar, this.width = 24.0, this.height = 24.0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: border ? const EdgeInsets.all(10) : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: border ? Theme.of(context).colorScheme.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(height),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset(
                avatar.asset,
                cacheHeight: height.toInt(),
                cacheWidth: width.toInt(),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          addNewPhotoProfile
              ? Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(110),
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 28,
                  ),
                )
              : const SizedBox.shrink(),
          Material(
            shape: const CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink(
              child: InkWell(
                onTap: () => onTap(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
