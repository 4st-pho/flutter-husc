import 'package:flutter/material.dart';
import 'package:test_app/constants/app_text_style.dart';
import 'package:test_app/features/classroom/models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(course.backgroud),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCourseName(),
          Expanded(child: Text(course.code, style: AppTextStyle.white14pxW400)),
          Text(course.teacher, style: AppTextStyle.white12pxW400),
        ],
      ),
    );
  }

  Widget _buildCourseName() {
    return Row(
      children: [
        Expanded(
          child: Text(
            course.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.white20pxW400,
          ),
        ),
        PopupMenuButton(
          offset: const Offset(0, 50),
          icon: const Icon(Icons.more_vert, color: Colors.white),
          color: Colors.white,
          itemBuilder: (context) {
            return [const PopupMenuItem(child: Text('Huỷ đăng ký        '))];
          },
        )
      ],
    );
  }
}
