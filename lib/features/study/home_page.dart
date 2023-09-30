import 'package:flutter/material.dart';
import 'package:test_app/constants/app_images.dart';
import 'package:test_app/constants/network_images.dart';
import 'package:test_app/core/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedMenuItem = 1;
  var currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          const Text(
            'Hello world!',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(
            NetworkImages.cat,
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppImages.juventus,
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const Text(
            'Ciao!',
            style: TextStyle(fontFamily: 'Fuggles', fontSize: 50),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [Colors.red, Colors.blue]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Your Text"),
                      duration: Duration(milliseconds: 300),
                    ));
                  },
                  icon: const Icon(Icons.home, color: Colors.red, size: 50),
                ),
                const Icon(Icons.account_box_outlined,
                    color: Colors.red, size: 50),
                const Icon(Icons.share, color: Colors.red, size: 50),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomNaviagtionBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
        ),
      ),
      centerTitle: true,
      title: const Text('Hello world!'),
      actions: [
        PopupMenuButton(
            initialValue: selectedMenuItem,
            onSelected: (value) => setState(() {
                  selectedMenuItem = value;
                }),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: 1, child: Text('Item 1')),
                const PopupMenuItem(value: 2, child: Text('Item 2')),
                const PopupMenuItem(value: 3, child: Text('Item 3')),
              ];
            })
      ],
    );
  }

  BottomNavigationBar _buildBottomNaviagtionBar() {
    return BottomNavigationBar(
      currentIndex: currentTabIndex,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      onTap: (index) {
        setState(() {
          currentTabIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
