import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/constants/app_color.dart';
import 'package:test_app/constants/app_images.dart';
import 'package:test_app/constants/app_text_style.dart';
import 'package:test_app/features/instagram/page/home_page/widgets/post_items.dart';
import 'package:test_app/features/instagram/page/home_page/widgets/story_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.black,
          title: const Text(
            "Instagram",
            style: AppTextStyle.white32pxBillabong,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.svgLoveIcon, height: 25),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppImages.chatIcon,
                color: Colors.white,
                height: 25,
              ),
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                const StoryBanner(),
                Divider(height: 1, color: AppColor.white.withOpacity(0.2)),
                const PostItems(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
