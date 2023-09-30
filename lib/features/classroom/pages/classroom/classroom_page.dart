import 'package:flutter/material.dart';
import 'package:test_app/constants/app_strings.dart';
import 'package:test_app/constants/app_text_style.dart';
import 'package:test_app/features/classroom/data/dummy_data.dart';
import 'package:test_app/features/classroom/pages/classroom/widgets/course_card.dart';
import 'package:test_app/features/classroom/widgets/classroom_drawer.dart';

class ClassroomPage extends StatelessWidget {
  const ClassroomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const ClassroomDrawer(),
      body: RefreshIndicator(
        color: Colors.black54,
        onRefresh: () async {},
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            _buildSuggestTask(),
            ...courses.map((course) => CourseCard(course: course))
          ],
        ),
      ),
      floatingActionButton: _buildFloatActionButton(context),
    );
  }

  Widget _buildFloatActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
          ),
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: const Text('Tạo lớp học'),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: const Text('Tham gia lớp học'),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            );
          },
        );
      },
      backgroundColor: Colors.white,
      shape: const CircleBorder(),
      child: Icon(Icons.add, color: Colors.blue.shade900),
    );
  }

  Widget _buildSuggestTask() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tuần này', style: AppTextStyle.black16px),
              const SizedBox(width: 10),
              Flexible(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Xem danh sách việc cần làm',
                    style: AppTextStyle.blue800Fs14pxW500,
                    textAlign: TextAlign.end,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Hiện không có bài tập nào',
            style: AppTextStyle.black13px7OP,
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(AppStrings.classroomLabel),
      scrolledUnderElevation: 0,
      elevation: 0,
      actions: [
        CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(currentUser.avatar),
        ),
        PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            color: Colors.white,
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text('Làm mới')),
                const PopupMenuItem(
                  child: Text('Gửi ý kiến phản hồi cho google'),
                ),
              ];
            })
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: Colors.black12, height: 1),
      ),
    );
  }
}
