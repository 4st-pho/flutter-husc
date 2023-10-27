import 'package:flutter/material.dart';
import 'package:test_app/constants/app_color.dart';
import 'package:test_app/constants/app_images.dart';
import 'package:test_app/constants/app_text_style.dart';
import 'package:test_app/features/instagram/data/storys_data.dart';
import 'package:test_app/features/instagram/page/home_page/widgets/story_item.dart';

class StoryBanner extends StatelessWidget {
  const StoryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          _buildMyStoryItem(),
          ...storys.map(
            (story) => Padding(
              padding: const EdgeInsets.only(left: 15),
              child: StoryItem(
                storyName: story.name,
                storyImage: story.image,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMyStoryItem() {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(AppImages.nAvatar),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 19,
                width: 19,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
                child: const Icon(
                  Icons.add_circle,
                  color: AppColor.buttonFollowColor,
                  size: 19,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 7),
        const Text('Your Story', style: AppTextStyle.white14Ellipsis),
      ],
    );
  }
}
