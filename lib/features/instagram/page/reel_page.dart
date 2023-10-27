import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:line_icons/line_icons.dart';
import 'package:test_app/constants/app_color.dart';
import 'package:test_app/constants/app_images.dart';
import 'package:test_app/constants/app_text_style.dart';
import 'package:test_app/features/instagram/data/reels_data.dart';
import 'package:test_app/features/instagram/models/reel.dart';

class ReelPage extends StatelessWidget {
  const ReelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reelsData.length,
        itemBuilder: (context, index) => ReelItem(reel: reelsData[index]),
      ),
    );
  }
}

class ReelItem extends StatelessWidget {
  final Reel reel;
  const ReelItem({required this.reel, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            reel.contentImg,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(child: _buildTopTitle()),
        _buildReelFunctional()
      ],
    );
  }

  Widget _buildReelFunctional() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(0.5)
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: _buildReelInfo(reel: reel)),
              _buildReelAction(reel: reel)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildReelAction({required Reel reel}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          const SizedBox(height: 10),
          SvgPicture.asset(AppImages.svgLoveIcon, height: 28),
          const SizedBox(height: 7),
          Text(
            reel.likesCount,
            style: AppTextStyle.white14pxW600,
          ),
          const SizedBox(height: 20),
          SvgPicture.asset(AppImages.svgCommentIcon, height: 28),
          const SizedBox(height: 7),
          Text(
            reel.commentCount,
            style: AppTextStyle.white14pxW600,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SvgPicture.asset(AppImages.svgMessageIcon, height: 28),
          ),
          const Icon(
            LineIcons.verticalEllipsis,
            color: AppColor.white,
            size: 25,
          ),
          const SizedBox(height: 20),
          Container(
            height: 32,
            width: 32,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.rectangle,
              borderRadius: (const BorderRadius.all(Radius.circular(7))),
              image: DecorationImage(
                image: NetworkImage(reel.musicImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildReelInfo({required Reel reel}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(reel.userImg),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  reel.username, //Username
                  style: AppTextStyle.white18pxW600,
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: const BorderSide(width: 1.5, color: AppColor.white),
                ),
                child: Text(
                  reel.isFollowed ? 'Followed' : 'Follow', //isFollowed
                  style: AppTextStyle.white14pxW600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 10),
            child: ExpandableText(
              reel.content,
              expandText: '',
              style: AppTextStyle.white14pxW600,
              collapseText: '',
              expandOnTextTap: true,
              collapseOnTextTap: true,
              maxLines: 2,
              linkColor: AppColor.white.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.music_note, size: 18, color: AppColor.white),
              const SizedBox(width: 5),
              RichText(
                  text: TextSpan(style: AppTextStyle.white14pxW600, children: [
                TextSpan(text: reel.musicOwner),
                const TextSpan(text: ' • '),
                TextSpan(text: reel.musicName),
              ])),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTopTitle() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.0),
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Reels", style: AppTextStyle.white25pxW800),
          SvgPicture.asset(AppImages.svgCameraIcon, height: 28),
        ],
      ),
    );
  }
}
