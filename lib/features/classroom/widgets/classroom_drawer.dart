import 'package:flutter/material.dart';
import 'package:test_app/constants/app_text_style.dart';
import 'package:test_app/extensions/string_extension.dart';
import 'package:test_app/features/classroom/data/dummy_data.dart';
import 'package:test_app/features/classroom/models/course.dart';
import 'package:test_app/utils/utils.dart';

class ClassroomDrawer extends StatelessWidget {
  const ClassroomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogo(),
            const Divider(),
            Expanded(child: _buildListItem()),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: RichText(
        text: TextSpan(
          text: 'G',
          style: TextStyle(fontSize: 24, color: Colors.blue.shade600),
          children: [
            TextSpan(text: 'o', style: TextStyle(color: Colors.red.shade600)),
            const TextSpan(text: 'o', style: TextStyle(color: Colors.amber)),
            TextSpan(text: 'g', style: TextStyle(color: Colors.blue.shade600)),
            const TextSpan(text: 'l', style: TextStyle(color: Colors.green)),
            TextSpan(text: 'e', style: TextStyle(color: Colors.red.shade700)),
            const TextSpan(
              text: ' Lớp học',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem() {
    return Scrollbar(
      child: ListView(
        children: [
          _buildDrawerItem(
              iconData: Icons.home, title: 'Lớp học', isActive: true),
          _buildDrawerItem(iconData: Icons.calendar_today, title: 'Lịch'),
          _buildDrawerItem(iconData: Icons.notifications, title: 'Thông báo'),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 15),
            child: Text(
              'Đã đăng ký',
              style: AppTextStyle.black13px7OP,
            ),
          ),
          _buildDrawerItem(iconData: Icons.task, title: 'Việc cần làm'),
          ...courses.map((course) => _buildCourseItem(course)),
          const Divider(),
          _buildDrawerItem(iconData: Icons.task_alt, title: 'Tệp ngoại tuyến'),
          _buildDrawerItem(iconData: Icons.archive, title: 'Lưu trữ lớp học'),
          _buildDrawerItem(iconData: Icons.folder, title: 'Thư mục lớp học'),
          _buildDrawerItem(iconData: Icons.settings, title: 'Cài đặt'),
          _buildDrawerItem(iconData: Icons.help, title: 'Trợ giúp'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData iconData,
    required String title,
    bool isActive = false,
  }) {
    return ListTile(
      onTap: () {},
      leading: Icon(iconData, color: isActive ? Colors.blue.shade900 : null),
      title: Text(
        title,
        style: TextStyle(color: isActive ? Colors.blue.shade900 : null),
      ),
    );
  }

  Widget _buildCourseItem(Course course) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -4),
      onTap: () {},
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: Utils.getColorForFirstCharater(course.name),
        foregroundColor: Colors.white,
        child: Center(child: Text(course.name.getFirstCharacter())),
      ),
      title: Text(course.name, style: AppTextStyle.black14pxW500),
      subtitle: Text(course.code, style: AppTextStyle.black13px7OP),
    );
  }
}
