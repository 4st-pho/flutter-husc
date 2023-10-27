import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/constants/app_images.dart';
import 'package:test_app/extensions/list_extension.dart';
import 'package:test_app/features/classroom/data/dummy_data.dart';
import 'package:test_app/features/instagram/page/account_page.dart';
import 'package:test_app/features/instagram/page/upload_page.dart';
import 'package:test_app/features/instagram/page/reel_page.dart';
import 'package:test_app/features/instagram/page/search_page.dart';
import 'package:test_app/features/instagram/page/home_page/home_page.dart';

class InstagramMainPage extends StatefulWidget {
  const InstagramMainPage({super.key});

  @override
  State<InstagramMainPage> createState() => _InstagramMainPageState();
}

class _InstagramMainPageState extends State<InstagramMainPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: mainAppBar(pageIndex),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBody() {
    List<Widget> screens = [
      const HomePage(),
      const SearchPage(),
      const UploadPage(),
      const ReelPage(),
      const AccountPage(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: List.generate(screens.length, (index) => screens[index]),
    );
  }

  Widget _buildBottomNavBar() {
    List<String> navIcons = [
      pageIndex == 0 ? AppImages.svgHomeActiveIcon : AppImages.svgHomeIcon,
      pageIndex == 1 ? AppImages.svgSearchActiveIcon : AppImages.svgSearchIcon,
      AppImages.svgUpload,
      pageIndex == 3 ? AppImages.svgReelActiveIcon : AppImages.svgReelIcon,
      currentUser.avatar
    ];
    void tapIcon(paageIndex) {
      setState(() {
        pageIndex = paageIndex;
      });
    }

    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navIcons.mapIndexed((index, icon) {
          return InkWell(
            onTap: () => tapIcon(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: index == 4
                  ? const CircleAvatar(
                      radius: 13,
                      backgroundImage: NetworkImage(AppImages.nAvatar),
                    )
                  // ignore: deprecated_member_use
                  : SvgPicture.asset(icon, height: 25, color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }
}
