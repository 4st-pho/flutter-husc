import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/constants/app_color.dart';
import 'package:test_app/constants/app_images.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.appFooterColor,
      child: Center(
        child: SvgPicture.asset(
          AppImages.svgUpload,
          width: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
