import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/constants/app_color.dart';
import 'package:line_icons/line_icons.dart';
import 'package:test_app/constants/app_images.dart';
import 'package:test_app/constants/app_text_style.dart';
import 'package:test_app/features/instagram/data/user_data.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              _buildSliverAppBar(),
              SliverToBoxAdapter(
                child: _buildUserInfomation(),
              ),
              const SliverToBoxAdapter(
                child: TabBar(
                  indicatorColor: AppColor.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(icon: Icon(LineIcons.table, color: Colors.white)),
                    Tab(icon: Icon(LineIcons.userCircle, color: Colors.white)),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(children: [
            SizedBox(width: double.infinity, height: 1000),
            SizedBox(width: double.infinity, height: 1000),
          ]),
        ),
      ),
    );
  }

  Widget _buildUserInfomation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(currentUser.avatar),
              ),
              const SizedBox(height: 4),
              Text(currentUser.fullname, style: AppTextStyle.white14pxW600),
              Text(currentUser.descreiption, style: AppTextStyle.white14pxW400),
            ],
          ),
        ),
        _buildInfoItem(valueName: 'Posts', quantity: currentUser.postsQuantity),
        _buildInfoItem(
            valueName: 'Followers', quantity: currentUser.followersQuantity),
        _buildInfoItem(
            valueName: 'Following', quantity: currentUser.followingQuantity),
      ],
    );
  }

  Widget _buildInfoItem({required String valueName, required int quantity}) {
    return Column(
      children: [
        Text('$quantity', style: AppTextStyle.white18pxW600),
        const SizedBox(height: 5),
        Text(valueName, style: AppTextStyle.white14pxW400),
      ],
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.black,
      titleTextStyle: AppTextStyle.white20pxW400,
      title: Row(children: [
        const Icon(
          Icons.lock,
          color: Colors.white,
          size: 14,
        ),
        Text(currentUser.username),
        const Icon(Icons.expand_more, color: Colors.white)
      ]),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.svgUpload, height: 25),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppImages.svgDrawerIcon,
            height: 25,
            // ignore: deprecated_member_use
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
