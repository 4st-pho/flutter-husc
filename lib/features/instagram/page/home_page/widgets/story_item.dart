import 'package:flutter/material.dart';
import 'package:test_app/constants/app_color.dart';
import 'package:test_app/constants/app_text_style.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    required this.storyName,
    required this.storyImage,
    super.key,
  });
  final String storyName;
  final String storyImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: AppColor.storyBorderColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CircleAvatar(
            radius: 37,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(storyImage),
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(storyName, style: AppTextStyle.white14Ellipsis),
      ],
    );
  }
}
