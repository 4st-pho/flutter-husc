import 'package:flutter/material.dart';
import 'package:test_app/constants/app_color.dart';
import 'package:test_app/constants/app_text_style.dart';
import 'package:test_app/features/instagram/data/search_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _buildListImages(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColor.textFieldBackground,
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            hintStyle: AppTextStyle.white15w400op05,
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(.8)),
          ),
          style: AppTextStyle.white14pxW600,
          cursorColor: AppColor.white.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildListImages() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (_, index) =>
          Image.network(searchImage[index], fit: BoxFit.cover),
      itemCount: searchImage.length,
    );
  }
}
