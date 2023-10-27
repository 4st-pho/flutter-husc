import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:test_app/constants/app_color.dart';
import 'package:test_app/constants/app_images.dart';
import 'package:test_app/constants/app_text_style.dart';
import 'package:test_app/features/instagram/data/posts_data.dart';
import 'package:test_app/features/instagram/models/post.dart';

class PostItems extends StatelessWidget {
  const PostItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: posts.map(
      (post) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopInfo(post),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: _buildPostImage(post),
              ),
              _buildPostAction(post),
              const SizedBox(height: 5),
              _buildMoreInfo(post)
            ],
          ),
        );
      },
    ).toList());
  }

  Widget _buildMoreInfo(Post post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: post.likedBy == null ? '' : 'Liked by ',
                    style: AppTextStyle.white14pxW300),
                TextSpan(
                  text: post.likedBy ?? '',
                  style: AppTextStyle.white14pxW600,
                ),
                TextSpan(
                  text: post.likedBy == null ? '' : ' and ',
                  style: AppTextStyle.white14pxW300,
                ),
                TextSpan(
                  text: post.likesCount,
                  style: AppTextStyle.white14pxW600,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: '${post.name} ', style: AppTextStyle.white15pxW600),
                TextSpan(text: post.caption, style: AppTextStyle.white14pxW400),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "View all ${post.commentCount} Comments",
            style: AppTextStyle.white15w400op05,
          ),
          const SizedBox(height: 3),
          Text(post.timeAgo, style: AppTextStyle.white12w400op05),
        ],
      ),
    );
  }

  Widget _buildPostAction(Post post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          SvgPicture.asset(
            post.isLoved ? AppImages.svgLovedIcon : AppImages.svgLoveIcon,
            height: 25,
          ),
          const SizedBox(width: 20),
          SvgPicture.asset(AppImages.svgCommentIcon, height: 25),
          const SizedBox(width: 20),
          SvgPicture.asset(AppImages.svgMessageIcon, height: 25),
          const Spacer(),
          SvgPicture.asset(AppImages.svgSaveIcon, height: 25),
        ],
      ),
    );
  }

  Widget _buildPostImage(Post post) {
    return Image.network(
      post.postImg,
      height: 400,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTopInfo(Post post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(post.profileImg),
          ),
          const SizedBox(width: 10),
          Text(post.name, style: AppTextStyle.white15pxW600),
          const Spacer(),
          const Icon(LineIcons.verticalEllipsis, color: AppColor.white)
        ],
      ),
    );
  }
}
