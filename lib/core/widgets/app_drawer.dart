import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const DrawerHeader(child: ListTile(title: Text('Xin chao'))),
            ListTile(
              title: const Text('Hello'),
              onTap: () => Navigator.of(context).pop(),
            ),
            const ListTile(title: Text('Ciao')),
            const ListTile(title: Text('Xin chao')),
          ],
        ),
      ),
    );
  }
}
