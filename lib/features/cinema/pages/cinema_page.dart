import 'package:flutter/material.dart';
import 'package:test_app/constants/app_images.dart';

class CinemaPage extends StatefulWidget {
  const CinemaPage({super.key});

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  final movieImages = [
    AppImages.camera,
    AppImages.chairs,
    AppImages.room,
    AppImages.film
  ];
  final _pageController = PageController(viewportFraction: 0.7, initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: ListView(
        children: [
          SizedBox(
            height: 500,
            child: PageView.builder(
              controller: _pageController,
              itemCount: movieImages.length,
              itemBuilder: (context, index) {
                final post = movieImages[index];
                return _buildCarouselItem(post, index);
              },
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: movieImages.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    movieImages[index],
                    width: 300,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String imageLink, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - value.abs() * 0.15).clamp(0, 1);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeIn.transform(value) * 400,
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageLink,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
